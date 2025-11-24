import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_cubit.dart';
import 'package:invotek/generated/l10n.dart';
// Sections - كل section يستمع فقط للحالة التي يحتاجها ويدير حالته الخاصة
import '../widgets/sections/connection_status_section.dart';
import '../widgets/sections/connected_printer_section.dart';
import '../widgets/sections/printer_discovery_section.dart';
import '../widgets/sections/print_settings_section.dart';
import '../widgets/sections/test_section.dart';

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

class _PrinterSettingsScreenState extends State<_PrinterSettingsScreenContent> {
  @override
  void dispose() {
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
          : SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // حالة الاتصال - يستمع فقط لحالة الاتصال
                  const ConnectionStatusSection(),
                  SizedBox(height: 24.h),

                  // إعدادات الطباعة - يدير حالته الخاصة
                  const PrintSettingsSection(),
                  SizedBox(height: 24.h),

                  // الطابعة المتصلة - يستمع فقط لحالة الاتصال
                  const ConnectedPrinterSection(),
                  SizedBox(height: 24.h),

                  // البحث عن الطابعات - يستمع فقط لحالة البحث والاتصال
                  const PrinterDiscoverySection(),
                  SizedBox(height: 24.h),

                  // // معاينة وطباعة تجريبية - يدير حالته الخاصة
                  // TestSection(
                  //   isGeneratingPreview: ,
                  //   testPreview: [],
                  //   onGeneratePreview: () {},
                  //   onPrintTest: () {},
                  // ),
                ],
              ),
            ),
    );
  }
}
