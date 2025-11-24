import 'dart:async';
import 'dart:typed_data';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/printing/presentation/ui/widgets/settings/paper_width_selector.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/invoice_language.dart';
import '../../../core/utils/paper_preset.dart';
import '../../cubit/printer_cubit.dart';
import '../widgets/dialogs/printing_dialog.dart';
import '../widgets/settings/language_selector.dart';
import '../widgets/settings/slice_height_selector.dart';
import '../widgets/test/preview_widget.dart';

class InvoicePrintDialog extends StatelessWidget {
  final InvoiceModel invoice;

  const InvoicePrintDialog({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    // استخدام PrinterCubit من DI (LazySingleton - نفس الـ instance)
    return BlocProvider.value(
      value: getIt<PrinterCubit>(),
      child: _InvoicePrintDialogContent(invoice: invoice),
    );
  }
}

class _InvoicePrintDialogContent extends StatefulWidget {
  final InvoiceModel invoice;

  const _InvoicePrintDialogContent({required this.invoice});

  @override
  State<_InvoicePrintDialogContent> createState() => _InvoicePrintDialogState();
}

class _InvoicePrintDialogState extends State<_InvoicePrintDialogContent> {
  List<Uint8List> _previewChunks = [];
  bool _isGeneratingPreview = false;
  bool _isPrinting = false;
  bool _isPrintCancelled = false;

  InvoiceLanguage _selectedLanguage = InvoiceLanguage.arabic;
  int _sliceHeight = 400;
  PaperPreset _paperWidth = PaperPreset.mm80;
  @override
  void initState() {
    super.initState();

    _loadSettings();
    _generatePreview();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final paperWidthStr = prefs.getString('printer_paper_width');
    final savedSliceHeight = prefs.getInt('printer_slice_height') ?? 900;
    final fontFamily = prefs.getString('printer_font_family') ?? 'Cairo';
    final languageStr = prefs.getString('printer_invoice_language');
    _paperWidth = PaperPreset.values.firstWhere(
      (e) => e.toString() == paperWidthStr,
      orElse: () => PaperPreset.mm80,
    );
    _selectedLanguage = InvoiceLanguage.values.firstWhere(
      (e) => e.toString() == languageStr,
      orElse: () => InvoiceLanguage.arabic,
    );
    _sliceHeight = savedSliceHeight;

    setState(() {});
  }

  Future<void> _generatePreview() async {
    setState(() => _isGeneratingPreview = true);
    try {
      final preview = await context.read<PrinterCubit>().previewInvoice(
        widget.invoice,
        language: _selectedLanguage,
        sliceHeight: _sliceHeight,
        paperWidth: _paperWidth,
      );
      if (mounted) {
        setState(() {
          _previewChunks = preview;
          _isGeneratingPreview = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isGeneratingPreview = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).previewError(e.toString())),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _printInvoice() async {
    final cubit = context.read<PrinterCubit>();
    if (!cubit.isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).connectPrinterFromSettings),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() {
      _isPrinting = true;
      _isPrintCancelled = false;
    });

    // عرض dialog مع loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: PrintingDialog(
          onCancel: () {
            _isPrintCancelled = true;
            cubit.cancelPrint();
            Navigator.of(context).pop();
          },
        ),
      ),
    );

    try {
      final success = await cubit.printInvoice(
        widget.invoice,
        language: _selectedLanguage,
        sliceHeight: _sliceHeight,
        paperWidth: _paperWidth,
      );

      if (mounted) {
        Navigator.of(context).pop(); // إغلاق dialog

        if (_isPrintCancelled) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).printCancelled),
              backgroundColor: AppColors.primary,
            ),
          );
        } else if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).printSuccess),
              backgroundColor: AppColors.primary,
            ),
          );
          Navigator.of(context).pop(); // إغلاق dialog الرئيسي
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).printFailed),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop(); // إغلاق dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).printErrorWithMessage(e.toString())),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isPrinting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).printInvoiceTitle,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Settings
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).settings,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 16.h),

                          PaperWidthSelector(
                            value: _paperWidth,
                            onChanged: (paperWidth) async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString(
                                'printer_paper_width',
                                paperWidth.name,
                              );
                              setState(() {
                                _paperWidth = paperWidth;
                              });
                              _generatePreview();
                            },
                          ),
                          SizedBox(height: 16.h),
                          LanguageSelector(
                            value: _selectedLanguage,
                            onChanged: (InvoiceLanguage language) {
                              setState(() => _selectedLanguage = language);
                              _generatePreview();
                            },
                          ),
                          SizedBox(height: 16.h),
                          SliceHeightSelector(
                            value: _sliceHeight,
                            onChanged: (height) async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setInt('printer_slice_height', height);
                              setState(() => _sliceHeight = height);
                              _generatePreview();
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Preview
                    if (_isGeneratingPreview)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (_previewChunks.isNotEmpty)
                      PreviewWidget(previewChunks: _previewChunks)
                    else
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.w),
                          child: Text(
                            S.of(context).noPreview,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            //      _buildBluetoothStatusTile(),
            // Actions
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.grey)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(S.of(context).cancel),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isPrinting ? null : _printInvoice,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: _isPrinting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.white,
                                ),
                              ),
                            )
                          : Text(S.of(context).print),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBluetoothStatusTile() {
    return StreamBuilder<BlueState>(
      stream: BluetoothPrintPlus.blueState,
      initialData:
          BlueState.blueOff, // optional: gives a deterministic first frame
      builder: (context, blueSnap) {
        final d = BluetoothPrintPlus.isConnected;
        final d3 = BluetoothPrintPlus.isBlueOn;

        print("d$d");
        print("d3$d3");
        final blueState = blueSnap.data;

        if (blueState == null) {
          return _StatusTile(
            icon: Icons.info_outline,
            text: S.of(context).checkingBluetoothStatus,
            color: Colors.grey,
          );
        }

        // ✅ If Bluetooth is OFF → show explicit message and stop here
        if (blueState == BlueState.blueOff) {
          return _StatusTile(
            icon: Icons.bluetooth_disabled,
            text: S.of(context).bluetoothOff,
            color: AppColors.error,
          );
        }

        // ✅ Bluetooth is ON → NOW listen to connection updates
        return StreamBuilder<ConnectState>(
          stream: BluetoothPrintPlus.connectState,
          builder: (context, connSnap) {
            final conn = connSnap.data;

            if (conn == null) {
              return _StatusTile(
                icon: Icons.link,
                text: S.of(context).checkingPrinterConnection,
                color: Colors.grey,
              );
            }

            if (conn == ConnectState.connected) {
              return _StatusTile(
                icon: Icons.check_circle,
                text: S.of(context).printerConnected,
                color: AppColors.primary,
              );
            }

            // default → disconnected
            return _StatusTile(
              icon: Icons.link_off,
              text: S.of(context).printerNotConnectedStatus,
              color: AppColors.error,
            );
          },
        );
      },
    );
  }
}

class _StatusTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _StatusTile({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
