import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/printing/ui/widgets/settings/paper_width_selector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/models/invoice_language.dart';
import '../../core/utils/paper_preset.dart';
import '../../presentation/cubit/printer_cubit.dart';
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
  int _sliceHeight = 900;
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
            content: Text('خطأ في المعاينة: $e'),
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
          content: const Text(
            'الطابعة غير متصلة. يرجى الاتصال بالطابعة من الإعدادات.',
          ),
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
      builder: (context) => PrintingDialog(
        onCancel: () {
          _isPrintCancelled = true;
          Navigator.of(context).pop();
        },
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
              content: const Text('تم إلغاء الطباعة'),
              backgroundColor: AppColors.primary,
            ),
          );
        } else if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('تمت الطباعة بنجاح'),
              backgroundColor: AppColors.primary,
            ),
          );
          Navigator.of(context).pop(); // إغلاق dialog الرئيسي
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('فشلت الطباعة'),
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
            content: Text('خطأ في الطباعة: $e'),
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
                    'طباعة الفاتورة',
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
                            'الإعدادات',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 16.h),

                          PaperWidthSelector(
                            value: _paperWidth,
                            onChanged: (paperWidth) {
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
                            onChanged: (height) {
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
                            'لا توجد معاينة',
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
                      child: const Text('إلغاء'),
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
                          : const Text('طباعة'),
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
}
