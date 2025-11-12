import 'dart:typed_data';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_item.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/printing/core/models/invoice_language.dart';
import 'package:invotek/features/printing/core/utils/paper_preset.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_cubit.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_state.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/connection/connected_printer_card.dart';
// Widgets
import '../widgets/connection/connection_status_widget.dart';
import '../widgets/dialogs/printing_dialog.dart';
import '../widgets/discovery/printer_discovery_widget.dart';
import '../widgets/settings/print_settings_widget.dart';
import '../widgets/test/test_section_widget.dart';

class PrinterSettingsScreen extends StatelessWidget {
  const PrinterSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام PrinterCubit من DI (LazySingleton - نفس الـ instance)
    return BlocProvider.value(
      value: getIt<PrinterCubit>(),
      child: const _PrinterSettingsScreenContent(),
    );
  }
}

class _PrinterSettingsScreenContent extends StatefulWidget {
  const _PrinterSettingsScreenContent();

  @override
  State<_PrinterSettingsScreenContent> createState() =>
      _PrinterSettingsScreenState();
}

class _PrinterSettingsScreenState extends State<_PrinterSettingsScreenContent>
    with WidgetsBindingObserver {
  // Settings
  PaperPreset _paperWidth = PaperPreset.mm80;
  int _sliceHeight = 400;
  InvoiceLanguage _invoiceLanguage = InvoiceLanguage.arabic;

  // Test Preview
  List<Uint8List> _testPreview = [];
  bool _isGeneratingPreview = false;

  // Printing state
  bool _isPrintCancelled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadSettings();
    context.read<PrinterCubit>().checkConnection();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      context.read<PrinterCubit>().checkConnection();
    }
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final paperWidthStr = prefs.getString('printer_paper_width');
    final sliceHeight = prefs.getInt('printer_slice_height');
    final languageStr = prefs.getString('printer_invoice_language');

    if (paperWidthStr != null) {
      _paperWidth = PaperPreset.values.firstWhere(
        (e) => e.toString() == paperWidthStr,
        orElse: () => PaperPreset.mm80,
      );
    }
    if (sliceHeight != null) _sliceHeight = sliceHeight;

    if (languageStr != null) {
      _invoiceLanguage = InvoiceLanguage.values.firstWhere(
        (e) => e.toString() == languageStr,
        orElse: () => InvoiceLanguage.arabic,
      );
    }

    context.read<PrinterCubit>().updateSettings(
      paperWidth: _paperWidth,
      sliceHeight: _sliceHeight,
      invoiceLanguage: _invoiceLanguage,
    );

    setState(() {});
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('printer_paper_width', _paperWidth.toString());
    await prefs.setInt('printer_slice_height', _sliceHeight);
    await prefs.setString(
      'printer_invoice_language',
      _invoiceLanguage.toString(),
    );
  }

  Future<void> _generateTestPreview() async {
    setState(() => _isGeneratingPreview = true);
    try {
      // إنشاء فاتورة تجريبية
      final now = DateTime.now().toIso8601String();
      final testInvoice = InvoiceModel(
        invoiceNumber: 'TEST-001',
        issueDate: DateTime.now().toString().split(' ')[0],
        customerName: S.of(context).testCustomer,
        paymentMethodCode: 'CASH',
        items: [
          InvoiceItem(
            id: 1,
            taxInvoiceId: 1,
            name: S.of(context).testProduct1,
            description: '',
            quantity: '2',
            price: '100.00',
            discount: '0.00',
            taxPercent: '15',
            taxAmount: '30.00',
            total: '200.00',
            createdAt: now,
            updatedAt: now,
            productId: 1,
          ),
          InvoiceItem(
            id: 2,
            taxInvoiceId: 1,
            name: S.of(context).testProduct2,
            description: '',
            quantity: '1',
            price: '50.00',
            discount: '0.00',
            taxPercent: '15',
            taxAmount: '7.50',
            total: '50.00',
            createdAt: now,
            updatedAt: now,
            productId: 2,
          ),
        ],
        subtotal: '250.00',
        taxAmount: '37.50',
        discount: '0.00',
        total: '287.50',
      );

      final preview = await context.read<PrinterCubit>().previewInvoice(
        testInvoice,
        paperWidth: _paperWidth,
        sliceHeight: _sliceHeight,
        language: _invoiceLanguage,
      );

      setState(() => _testPreview = preview);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).previewError(e.toString())),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() => _isGeneratingPreview = false);
    }
  }

  Future<void> _printTest() async {
    final cubit = context.read<PrinterCubit>();
    if (!cubit.isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).pleaseConnectPrinterFirst),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // عرض dialog مع loading
    _isPrintCancelled = false;
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
      final now = DateTime.now().toIso8601String();
      final testInvoice = InvoiceModel(
        invoiceNumber: 'TEST-001',
        issueDate: DateTime.now().toString().split(' ')[0],
        customerName: S.of(context).testCustomer,
        paymentMethodCode: 'CASH',
        items: [
          InvoiceItem(
            id: 1,
            taxInvoiceId: 1,
            name: S.of(context).testProduct1,
            description: '',
            quantity: '2',
            price: '100.00',
            discount: '0.00',
            taxPercent: '15',
            taxAmount: '30.00',
            total: '200.00',
            createdAt: now,
            updatedAt: now,
            productId: 1,
          ),
        ],
        subtotal: '200.00',
        taxAmount: '30.00',
        discount: '0.00',
        total: '230.00',
      );

      bool success = false;
      if (!_isPrintCancelled) {
        success = await cubit.printInvoice(
          testInvoice,
          paperWidth: _paperWidth,
          sliceHeight: _sliceHeight,
          language: _invoiceLanguage,
        );
      }

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
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isBlueOn = BluetoothPrintPlus.isBlueOn;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          s.printSettings,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: !isBlueOn
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bluetooth_disabled,
                    size: 64,
                    color: AppColors.error,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    S.of(context).pleaseEnableBluetooth,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
            )
          : BlocBuilder<PrinterCubit, PrinterState>(
              builder: (context, state) {
                final cubit = context.read<PrinterCubit>();
                final isConnected = cubit.isConnected;
                final connectedDevice = cubit.connectedDevice;
                final isScanning = state.maybeWhen(
                  scanning: (_) => true,
                  orElse: () => false,
                );
                return SingleChildScrollView(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // حالة الاتصال
                      ConnectionStatusWidget(
                        isConnected: isConnected,
                        connectedDevice: connectedDevice,
                        onDisconnect: isConnected
                            ? () => cubit.disconnect()
                            : null,
                      ),
                      SizedBox(height: 24.h),

                      // إعدادات الطباعة
                      PrintSettingsWidget(
                        paperWidth: _paperWidth,
                        sliceHeight: _sliceHeight,
                        invoiceLanguage: _invoiceLanguage,
                        onPaperWidthChanged: (value) {
                          setState(() => _paperWidth = value);
                          cubit.updateSettings(paperWidth: value);
                          _saveSettings();
                        },
                        onSliceHeightChanged: (value) {
                          setState(() => _sliceHeight = value);
                          cubit.updateSettings(sliceHeight: value);
                          _saveSettings();
                        },
                        onLanguageChanged: (value) {
                          setState(() => _invoiceLanguage = value);
                          cubit.updateSettings(invoiceLanguage: value);
                          _saveSettings();
                        },
                      ),
                      SizedBox(height: 24.h),

                      // الطابعة المتصلة
                      if (isConnected && connectedDevice != null) ...[
                        ConnectedPrinterCard(
                          connectedDevice: connectedDevice,
                          onDisconnect: () => cubit.disconnect(),
                        ),
                        SizedBox(height: 24.h),
                      ],

                      // البحث عن الطابعات
                      PrinterDiscoveryWidget(
                        scanResults$: cubit.scanResults$,
                        isScanning: isScanning,
                        connectedDevice: connectedDevice,
                        isConnected: isConnected,
                        onStartScan: () => cubit.startScan(),
                        onStopScan: () => cubit.stopScan(),
                        onConnectToDevice: (device) => cubit.connect(device),
                      ),
                      SizedBox(height: 24.h),

                      // معاينة وطباعة تجريبية
                      TestSectionWidget(
                        isGeneratingPreview: _isGeneratingPreview,
                        isConnected: isConnected,
                        testPreview: _testPreview,
                        onGeneratePreview: _generateTestPreview,
                        onPrintTest: _printTest,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
