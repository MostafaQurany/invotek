import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/printing/ui/screens/thermal_print_screen.dart';
import 'package:invotek/features/printing/ui/screens/pdf_preview_screen.dart';
import 'package:invotek/generated/l10n.dart';

class PrintOptionsScreen extends StatelessWidget {
  final InvoiceModel invoice;

  const PrintOptionsScreen({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          s.printOptions,
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
            onPressed: () => _navigateToSettings(context),
            icon: Icon(Icons.settings, color: AppColors.primary),
            tooltip: s.printSettings,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            // Header Card
            _buildHeaderCard(context, s),

            SizedBox(height: 24.h),

            // Print Options
            Expanded(
              child: Column(
                children: [
                  // Thermal Print Option
                  _buildPrintOption(
                    context: context,
                    icon: Icons.receipt,
                    title: s.thermalPrint,
                    subtitle: s.thermalPrintDesc,
                    color: AppColors.primary,
                    onTap: () => _navigateToThermalPrint(context),
                  ),

                  SizedBox(height: 16.h),

                  // PDF Print Option
                  _buildPrintOption(
                    context: context,
                    icon: Icons.picture_as_pdf,
                    title: s.pdfPrint,
                    subtitle: s.pdfPrintDesc,
                    color: AppColors.success,
                    onTap: () => _navigateToPDFPreview(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, S s) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Icon(Icons.print, color: AppColors.primary, size: 30.sp),
          ),
          SizedBox(height: 16.h),
          Text(
            s.printInvoice,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${s.invoiceNumber}: ${invoice.invoiceNumber}',
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
          ),
          SizedBox(height: 4.h),
          Text(
            '${s.issueDate}: ${invoice.issueDate}',
            style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildPrintOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Icon(icon, color: color, size: 24.sp),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textSecondary,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToThermalPrint(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThermalPrintScreen(invoice: invoice),
      ),
    );
  }

  void _navigateToPDFPreview(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFPreviewScreen(invoice: invoice),
      ),
    );
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.printerSettingsRoute);
  }
}
