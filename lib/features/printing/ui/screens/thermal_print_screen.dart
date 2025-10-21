import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/printing/ui/controllers/printing_controller.dart';
import 'package:invotek/generated/l10n.dart';

class ThermalPrintScreen extends StatefulWidget {
  final InvoiceModel invoice;

  const ThermalPrintScreen({super.key, required this.invoice});

  @override
  State<ThermalPrintScreen> createState() => _ThermalPrintScreenState();
}

class _ThermalPrintScreenState extends State<ThermalPrintScreen>
    with TickerProviderStateMixin {
  late PrintingController _controller;
  late AnimationController _statusAnimationController;
  late Animation<double> _statusAnimation;
  late AnimationController _printAnimationController;

  @override
  void initState() {
    super.initState();
    _controller = PrintingController();
    _controller.loadSettings();

    _statusAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _statusAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _statusAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _printAnimationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _statusAnimationController.dispose();
    _printAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          s.thermalPrint,
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
            onPressed: _testPrinter,
            icon: Icon(Icons.print, color: AppColors.primary),
            tooltip: s.testPrint,
          ),
        ],
      ),
      body: ChangeNotifierProvider<PrintingController>(
        create: (_) => _controller,
        child: Consumer<PrintingController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                // Printer Status Card
                _buildPrinterStatusCard(context, s, controller),

                // Receipt Preview
                Expanded(child: _buildReceiptPreview(context, s)),

                // Print Button
                _buildPrintButton(context, s, controller),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPrinterStatusCard(
    BuildContext context,
    S s,
    PrintingController controller,
  ) {
    return Container(
      margin: EdgeInsets.all(20.w),
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
          Row(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: _getStatusColor(controller).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Icon(
                  _getStatusIcon(controller),
                  color: _getStatusColor(controller),
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.printerStatus,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    AnimatedBuilder(
                      animation: _statusAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: controller.isLoading
                              ? _statusAnimation.value
                              : 1.0,
                          child: Text(
                            controller.getPrinterStatus(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: _getStatusColor(controller),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (controller.isLoading)
                SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),
          if (!controller.settings.isValid && !controller.isLoading) ...[
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _navigateToSettings,
                icon: Icon(Icons.settings, size: 18.sp),
                label: Text(s.printerSettings),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.warning,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReceiptPreview(BuildContext context, S s) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
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
          // Preview Header
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.receipt_long, color: AppColors.primary, size: 20.sp),
                SizedBox(width: 8.w),
                Text(
                  s.thermalReceipt,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '80mm',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Receipt Content - Sunmi Thermal Printer Style
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                child: Center(
                  child: Container(
                    width: 280.w, // Sunmi printer width (80mm = ~280px)
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: _buildSunmiThermalReceipt(s),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSunmiThermalReceipt(S s) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Company Header
          _buildSunmiReceiptHeader(),
          SizedBox(height: 8.h),

          // Receipt Title
          _buildSunmiReceiptTitle(),
          SizedBox(height: 6.h),

          // Invoice Info
          _buildSunmiInvoiceInfo(s),
          SizedBox(height: 8.h),

          // Separator Line
          _buildSunmiSeparatorLine(),
          SizedBox(height: 8.h),

          // Customer Info
          _buildSunmiCustomerInfo(s),
          SizedBox(height: 8.h),

          // Items Header
          _buildSunmiItemsHeader(),
          SizedBox(height: 4.h),

          // Items List
          _buildSunmiItemsList(),
          SizedBox(height: 8.h),

          // Separator Line
          _buildSunmiSeparatorLine(),
          SizedBox(height: 8.h),

          // Totals Section
          _buildSunmiTotalsSection(s),
          SizedBox(height: 12.h),

          // Footer
          _buildSunmiReceiptFooter(s),
        ],
      ),
    );
  }

  Widget _buildReceiptHeader() {
    return Column(
      children: [
        // Company Logo/Name
        Text(
          'Invotek',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'نظام إدارة الفواتير',
          style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildReceiptTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        'فاتورة ضريبية',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildInvoiceInfo(S s) {
    return Column(
      children: [
        _buildInfoRow('رقم الفاتورة', widget.invoice.invoiceNumber ?? ''),
        _buildInfoRow('تاريخ الإصدار', widget.invoice.issueDate ?? ''),
        _buildInfoRow(
          'وقت الإصدار',
          DateTime.now().toString().substring(11, 19),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 11.sp, color: AppColors.textPrimary),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 11.sp, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildSeparatorLine() {
    return Container(
      height: 1,
      color: AppColors.border,
      child: Row(
        children: List.generate(
          32,
          (index) => Expanded(
            child: Container(
              height: 1,
              color: index % 2 == 0 ? AppColors.border : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerInfo(S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'بيانات العميل',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'الاسم: ${widget.invoice.customerName ?? 'غير محدد'}',
          style: TextStyle(fontSize: 11.sp, color: AppColors.textPrimary),
        ),
      ],
    );
  }

  Widget _buildItemsHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'المجموع',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'السعر',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'الكمية',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'المنتج',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    return Column(
      children:
          widget.invoice.items
              ?.map(
                (item) => Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          item.total.toString(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          item.quantity.toString(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item.name ?? '',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList() ??
          [],
    );
  }

  Widget _buildTotalsSection(S s) {
    return Column(
      children: [
        _buildTotalRow(s.subtotal, widget.invoice.subtotal ?? '0'),
        _buildTotalRow(s.tax, widget.invoice.taxAmount ?? '0'),
        _buildTotalRow(s.discount, widget.invoice.discount ?? '0'),
        SizedBox(height: 4.h),
        _buildSeparatorLine(),
        SizedBox(height: 4.h),
        _buildTotalRow(s.total, widget.invoice.total ?? '0', isTotal: true),
      ],
    );
  }

  Widget _buildReceiptFooter(S s) {
    return Column(
      children: [
        _buildSeparatorLine(),
        SizedBox(height: 8.h),
        Text(
          s.thankYou,
          style: TextStyle(fontSize: 10.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 4.h),
        Text(
          'شكراً لاختيارك خدماتنا',
          style: TextStyle(fontSize: 9.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 8.h),
        Text(
          'تم طباعة هذه الفاتورة بواسطة نظام Invotek',
          style: TextStyle(fontSize: 8.sp, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  // Sunmi Thermal Printer Specific Methods
  Widget _buildSunmiReceiptHeader() {
    return Column(
      children: [
        Text(
          'INVOTEK',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          'نظام إدارة الفواتير',
          style: TextStyle(fontSize: 10.sp, color: Colors.black),
        ),
        SizedBox(height: 2.h),
        Text(
          'Invoice Management System',
          style: TextStyle(fontSize: 8.sp, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildSunmiReceiptTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Text(
        'فاتورة ضريبية',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSunmiInvoiceInfo(S s) {
    return Column(
      children: [
        _buildSunmiInfoRow('رقم الفاتورة', widget.invoice.invoiceNumber ?? ''),
        _buildSunmiInfoRow('تاريخ الإصدار', widget.invoice.issueDate ?? ''),
        _buildSunmiInfoRow(
          'وقت الإصدار',
          DateTime.now().toString().substring(11, 19),
        ),
      ],
    );
  }

  Widget _buildSunmiInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 9.sp,
              color: Colors.black,
              fontFamily: 'monospace',
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 9.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildSunmiSeparatorLine() {
    return Container(
      height: 1,
      color: Colors.black,
      child: Row(
        children: List.generate(
          32,
          (index) => Expanded(
            child: Container(
              height: 1,
              color: index % 2 == 0 ? Colors.black : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSunmiCustomerInfo(S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'بيانات العميل',
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          'الاسم: ${widget.invoice.customerName ?? 'غير محدد'}',
          style: TextStyle(fontSize: 9.sp, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildSunmiItemsHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'المجموع',
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'السعر',
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'الكمية',
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'المنتج',
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSunmiItemsList() {
    return Column(
      children:
          widget.invoice.items
              ?.map(
                (item) => Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          item.total.toString(),
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.black,
                            fontFamily: 'monospace',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.black,
                            fontFamily: 'monospace',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          item.quantity.toString(),
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.black,
                            fontFamily: 'monospace',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item.name ?? '',
                          style: TextStyle(fontSize: 8.sp, color: Colors.black),
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList() ??
          [],
    );
  }

  Widget _buildSunmiTotalsSection(S s) {
    return Column(
      children: [
        _buildSunmiTotalRow(s.subtotal, widget.invoice.subtotal ?? '0'),
        _buildSunmiTotalRow(s.tax, widget.invoice.taxAmount ?? '0'),
        _buildSunmiTotalRow(s.discount, widget.invoice.discount ?? '0'),
        SizedBox(height: 2.h),
        _buildSunmiSeparatorLine(),
        SizedBox(height: 2.h),
        _buildSunmiTotalRow(
          s.total,
          widget.invoice.total ?? '0',
          isTotal: true,
        ),
      ],
    );
  }

  Widget _buildSunmiTotalRow(
    String label,
    String value, {
    bool isTotal = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 10.sp : 8.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 10.sp : 8.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSunmiReceiptFooter(S s) {
    return Column(
      children: [
        _buildSunmiSeparatorLine(),
        SizedBox(height: 4.h),
        Text(
          s.thankYou,
          style: TextStyle(fontSize: 8.sp, color: Colors.black),
        ),
        SizedBox(height: 2.h),
        Text(
          'شكراً لاختيارك خدماتنا',
          style: TextStyle(fontSize: 7.sp, color: Colors.black),
        ),
        SizedBox(height: 4.h),
        Text(
          'تم طباعة هذه الفاتورة بواسطة نظام Invotek',
          style: TextStyle(fontSize: 6.sp, color: Colors.black54),
        ),
        SizedBox(height: 2.h),
        Text(
          'Powered by Invotek System',
          style: TextStyle(fontSize: 6.sp, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildTotalRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 12.sp : 10.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 12.sp : 10.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrintButton(
    BuildContext context,
    S s,
    PrintingController controller,
  ) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          if (controller.error.isNotEmpty) ...[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.error.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.error, color: AppColors.error, size: 20.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      controller.error,
                      style: TextStyle(fontSize: 12.sp, color: AppColors.error),
                    ),
                  ),
                ],
              ),
            ),
          ],

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: controller.settings.isValid && !controller.isPrinting
                  ? _printReceipt
                  : null,
              icon: controller.isPrinting
                  ? SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.white,
                        ),
                      ),
                    )
                  : Icon(Icons.print, size: 20.sp),
              label: Text(
                controller.isPrinting ? 'جاري الطباعة...' : s.printReceipt,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    controller.settings.isValid && !controller.isPrinting
                    ? AppColors.primary
                    : AppColors.greyLight,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: controller.settings.isValid && !controller.isPrinting
                    ? 2
                    : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(PrintingController controller) {
    if (controller.isLoading) return AppColors.info;
    if (controller.error.isNotEmpty) return AppColors.error;
    if (!controller.settings.isValid) return AppColors.warning;
    if (controller.isPrinting) return AppColors.primary;
    return AppColors.success;
  }

  IconData _getStatusIcon(PrintingController controller) {
    if (controller.isLoading) return Icons.search;
    if (controller.error.isNotEmpty) return Icons.error;
    if (!controller.settings.isValid) return Icons.warning;
    if (controller.isPrinting) return Icons.print;
    return Icons.check_circle;
  }

  void _printReceipt() async {
    final success = await _controller.printInvoice(widget.invoice);
    final s = S.of(context);

    if (success) {
      _printAnimationController.forward();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(s.printSuccess),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${s.printError}: ${_controller.error}'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    }
  }

  void _testPrinter() async {
    final success = await _controller.testPrinter();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success ? 'الطابعة تعمل بشكل صحيح' : 'فشل في اختبار الطابعة',
        ),
        backgroundColor: success ? AppColors.success : AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _navigateToSettings() {
    Navigator.pushNamed(context, AppRoutes.printerSettingsRoute);
  }
}
