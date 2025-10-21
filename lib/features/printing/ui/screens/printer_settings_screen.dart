import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/printing/ui/controllers/printing_controller.dart';
import 'package:invotek/features/printing/ui/widgets/printer_discovery_widget.dart';
import 'package:invotek/features/printing/services/sunmi_printer_service.dart';
import 'package:invotek/generated/l10n.dart';

class PrinterSettingsScreen extends StatefulWidget {
  const PrinterSettingsScreen({super.key});

  @override
  State<PrinterSettingsScreen> createState() => _PrinterSettingsScreenState();
}

class _PrinterSettingsScreenState extends State<PrinterSettingsScreen> {
  late PrintingController _controller;
  final _formKey = GlobalKey<FormState>();

  // SUNMI specific variables
  bool _isSunmiConnected = false;
  String _sunmiPrinterInfo = '';
  bool _isCheckingConnection = false;

  @override
  void initState() {
    super.initState();
    _controller = PrintingController();
    _controller.loadSettings();
    _initializeSunmiPrinter();
  }

  /// تهيئة طابعة SUNMI
  Future<void> _initializeSunmiPrinter() async {
    try {
      // فحص ما إذا كانت طابعة SUNMI متاحة على الجهاز
      setState(() {
        _isSunmiConnected = false;
        _sunmiPrinterInfo = 'جاري فحص طابعة SUNMI...';
      });

      // انتظار قصير قبل المحاولة
      await Future.delayed(Duration(milliseconds: 500));

      // استخدام الخدمة الحقيقية لتهيئة الطابعة
      final success = await SunmiPrinterService.initializePrinter();

      if (success) {
        final info = await SunmiPrinterService.getPrinterInfo();
        setState(() {
          _isSunmiConnected = true;
          _sunmiPrinterInfo =
              'SUNMI Printer Connected\nStatus: Ready for printing\nType: ${info['type']}';
        });
      } else {
        setState(() {
          _isSunmiConnected = false;
          _sunmiPrinterInfo =
              'SUNMI Printer Not Available\nPlease check printer connection';
        });
      }
    } catch (e) {
      setState(() {
        _isSunmiConnected = false;
        _sunmiPrinterInfo =
            'SUNMI Printer Not Available\nError: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    print("information of sunmi printer: $_sunmiPrinterInfo");
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          s.printerSettings,
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
        actions: [
          IconButton(
            onPressed: _checkSunmiConnection,
            icon: Icon(Icons.refresh, color: AppColors.primary),
            tooltip: 'فحص اتصال SUNMI',
          ),
          IconButton(
            onPressed: _testSunmiPrint,
            icon: Icon(Icons.print, color: AppColors.primary),
            tooltip: 'اختبار طباعة SUNMI',
          ),
        ],
      ),
      body: ChangeNotifierProvider<PrintingController>(
        create: (_) => _controller,
        child: Consumer<PrintingController>(
          builder: (context, controller, child) {
            if (controller.isLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'جاري تحميل الإعدادات...',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SUNMI Status Card
                    _buildSunmiStatusCard(),

                    SizedBox(height: 24.h),

                    // Printer Discovery
                    PrinterDiscoveryWidget(),

                    SizedBox(height: 24.h),

                    // Settings Form
                    _buildSettingsForm(context, s),

                    SizedBox(height: 32.h),

                    // Save Button with enhanced design
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton.icon(
                        onPressed: _saveSettings,
                        icon: Icon(Icons.save, size: 20.sp),
                        label: Text(
                          'حفظ الإعدادات',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          elevation: 8,
                          shadowColor: AppColors.primary.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSunmiStatusCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _isSunmiConnected
              ? [
                  AppColors.success.withOpacity(0.1),
                  AppColors.success.withOpacity(0.05),
                ]
              : [
                  AppColors.error.withOpacity(0.1),
                  AppColors.error.withOpacity(0.05),
                ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: _isSunmiConnected ? AppColors.success : AppColors.error,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: (_isSunmiConnected ? AppColors.success : AppColors.error)
                .withOpacity(0.2),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with animated icon
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: _isSunmiConnected
                      ? AppColors.success
                      : AppColors.error,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color:
                          (_isSunmiConnected
                                  ? AppColors.success
                                  : AppColors.error)
                              .withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  _isSunmiConnected ? Icons.print : Icons.print_disabled,
                  color: AppColors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'طابعة SUNMI الحرارية',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      _isSunmiConnected ? 'متصل ومستعد للطباعة' : 'غير متصل',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: _isSunmiConnected
                            ? AppColors.success
                            : AppColors.error,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (_isCheckingConnection)
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 20.h),

          // Status info with better formatting
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.border.withOpacity(0.5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'معلومات الطابعة:',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  _sunmiPrinterInfo,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          // Action buttons with improved design
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48.h,
                  child: ElevatedButton.icon(
                    onPressed: _isCheckingConnection
                        ? null
                        : _checkSunmiConnection,
                    icon: Icon(Icons.refresh, size: 18.sp),
                    label: Text(
                      _isCheckingConnection ? 'جاري الفحص...' : 'فحص الاتصال',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      elevation: 3,
                      shadowColor: AppColors.primary.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: SizedBox(
                  height: 48.h,
                  child: ElevatedButton.icon(
                    onPressed: _isSunmiConnected && !_isCheckingConnection
                        ? _testSunmiPrint
                        : null,
                    icon: Icon(Icons.print, size: 18.sp),
                    label: Text(
                      'اختبار الطباعة',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isSunmiConnected
                          ? AppColors.success
                          : AppColors.grey,
                      foregroundColor: AppColors.white,
                      elevation: _isSunmiConnected ? 3 : 0,
                      shadowColor: _isSunmiConnected
                          ? AppColors.success.withOpacity(0.3)
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsForm(BuildContext context, S s) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: AppColors.border.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.settings,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.printSettings,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'تخصيص إعدادات طابعة SUNMI',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // SUNMI Printer Settings Section
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Icon(Icons.print, color: AppColors.primary, size: 20.sp),
                SizedBox(width: 12.w),
                Text(
                  'إعدادات طابعة SUNMI',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // Paper Size (SUNMI specific)
          _buildDropdownField(
            label: 'حجم الورق',
            value: _controller.settings.paperSize,
            items: [
              {'value': '80mm', 'label': '80mm (SUNMI Standard)'},
              {'value': '58mm', 'label': '58mm (SUNMI Compact)'},
            ],
            onChanged: (value) {
              _controller.updateSetting('paperSize', value);
            },
          ),

          SizedBox(height: 16.h),

          // Print Quality (SUNMI specific)
          _buildDropdownField(
            label: 'جودة الطباعة',
            value: _controller.settings.printQuality,
            items: [
              {'value': 'high', 'label': 'عالية (SUNMI HD)'},
              {'value': 'medium', 'label': 'متوسطة (SUNMI Standard)'},
              {'value': 'fast', 'label': 'سريعة (SUNMI Fast)'},
            ],
            onChanged: (value) {
              _controller.updateSetting('printQuality', value);
            },
          ),

          SizedBox(height: 16.h),

          // SUNMI Printer Name
          _buildTextField(
            label: 'اسم طابعة SUNMI',
            value: _controller.settings.printerName ?? 'SUNMI Printer',
            onChanged: (value) {
              _controller.updateSetting('printerName', value);
            },
          ),

          SizedBox(height: 16.h),

          // SUNMI Auto Connect Switch
          _buildSwitchField(
            label: 'اتصال تلقائي بـ SUNMI',
            value: _controller.settings.autoConnect,
            onChanged: (value) {
              _controller.updateSetting('autoConnect', value);
            },
          ),

          SizedBox(height: 16.h),

          // SUNMI Test Print Switch
          _buildSwitchField(
            label: 'تفعيل اختبار SUNMI',
            value: _controller.settings.enableTestPrint,
            onChanged: (value) {
              _controller.updateSetting('enableTestPrint', value);
            },
          ),

          SizedBox(height: 16.h),

          // SUNMI Debug Mode Switch
          _buildSwitchField(
            label: 'وضع التصحيح (Debug Mode)',
            value: false,
            onChanged: (value) {
              // TODO: Add debug mode setting
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<Map<String, String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.tune, color: AppColors.primary, size: 18.sp),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              initialValue: value,
              isExpanded: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.border.withOpacity(0.5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.border.withOpacity(0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 16.h,
                ),
                prefixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.primary,
                ),
              ),
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item['value'],
                      child: Expanded(
                        child: Text(
                          item['label']!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.edit, color: AppColors.primary, size: 18.sp),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              initialValue: value,
              keyboardType: keyboardType,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.border.withOpacity(0.5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.border.withOpacity(0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 16.h,
                ),
                prefixIcon: Icon(
                  Icons.text_fields,
                  color: AppColors.primary.withOpacity(0.7),
                ),
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchField({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: value
            ? AppColors.primary.withOpacity(0.05)
            : AppColors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: value
              ? AppColors.primary.withOpacity(0.2)
              : AppColors.border.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: value ? AppColors.primary : AppColors.grey,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              value ? Icons.check : Icons.close,
              color: AppColors.white,
              size: 16.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Transform.scale(
            scale: 1.2,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: AppColors.primary,
              activeTrackColor: AppColors.primary.withOpacity(0.3),
              inactiveThumbColor: AppColors.grey,
              inactiveTrackColor: AppColors.grey.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }

  void _saveSettings() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم حفظ الإعدادات بنجاح'),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
      Navigator.pop(context);
    }
  }

  /// فحص اتصال طابعة SUNMI
  Future<void> _checkSunmiConnection() async {
    setState(() {
      _isCheckingConnection = true;
      _sunmiPrinterInfo = 'جاري فحص الاتصال...';
    });

    try {
      // استخدام الخدمة الحقيقية لفحص الاتصال
      final isConnected = await SunmiPrinterService.isPrinterConnected();

      if (isConnected) {
        final info = await SunmiPrinterService.getPrinterInfo();
        setState(() {
          _isSunmiConnected = true;
          _sunmiPrinterInfo =
              'SUNMI Printer Connected\nStatus: Ready for printing\nType: ${info['type']}';
        });
      } else {
        setState(() {
          _isSunmiConnected = false;
          _sunmiPrinterInfo =
              'SUNMI Printer Not Connected\nPlease check printer connection';
        });
      }
    } catch (e) {
      setState(() {
        _isSunmiConnected = false;
        _sunmiPrinterInfo =
            'SUNMI Printer Not Available\nError: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isCheckingConnection = false;
      });
    }
  }

  /// اختبار طباعة SUNMI
  Future<void> _testSunmiPrint() async {
    try {
      // استخدام الخدمة الحقيقية لاختبار الطباعة
      final success = await SunmiPrinterService.printTestPage();

      if (!success) {
        throw Exception('فشل في طباعة صفحة الاختبار');
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم إرسال أمر الطباعة بنجاح'),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ في الطباعة: ${e.toString()}'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    }
  }
}
