import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/printing/ui/controllers/printing_controller.dart';
import 'package:invotek/features/printing/services/printing_service.dart';
import 'package:invotek/generated/l10n.dart';

class PDFPreviewScreen extends StatefulWidget {
  final InvoiceModel invoice;

  const PDFPreviewScreen({super.key, required this.invoice});

  @override
  State<PDFPreviewScreen> createState() => _PDFPreviewScreenState();
}

class _PDFPreviewScreenState extends State<PDFPreviewScreen>
    with TickerProviderStateMixin {
  late PrintingController _controller;
  late AnimationController _loadingAnimationController;
  late Animation<double> _loadingAnimation;
  Uint8List? _pdfBytes;
  bool _isGenerating = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _controller = PrintingController();
    _controller.loadSettings();

    _loadingAnimationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _loadingAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _loadingAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _generatePDF();
  }

  @override
  void dispose() {
    _loadingAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          s.pdfPreview,
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
        // actions: [
        //   if (_pdfBytes != null) ...[
        //     IconButton(
        //       onPressed: _savePDF,
        //       icon: Icon(Icons.download),
        //       tooltip: s.savePDF,
        //     ),
        //     IconButton(
        //       onPressed: _sharePDF,
        //       icon: Icon(Icons.share),
        //       tooltip: 'مشاركة PDF',
        //     ),
        //     IconButton(
        //       onPressed: _printPDF,
        //       icon: Icon(Icons.print),
        //       tooltip: s.printReceipt,
        //     ),
        //   ],
        // ],
      ),
      body: ChangeNotifierProvider<PrintingController>(
        create: (_) => _controller,
        child: Consumer<PrintingController>(
          builder: (context, controller, child) {
            if (_isGenerating) {
              return _buildLoadingState(s);
            }

            if (_error.isNotEmpty) {
              return _buildErrorState(s);
            }

            if (_pdfBytes == null) {
              return _buildEmptyState(s);
            }

            return _buildPDFPreview(s);
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState(S s) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _loadingAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: 0.8 + (_loadingAnimation.value * 0.2),
                child: Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Icon(
                    Icons.picture_as_pdf,
                    color: AppColors.primary,
                    size: 40.sp,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 24.h),
          Text(
            s.generatingPDF,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'جاري إنشاء PDF للفاتورة...',
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: 40.w,
            height: 40.w,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(S s) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Icon(
                Icons.error_outline,
                color: AppColors.error,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              s.pdfError,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              _error,
              style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: _generatePDF,
              icon: Icon(Icons.refresh, size: 18.sp),
              label: Text('إعادة المحاولة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(S s) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: AppColors.greyLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Icon(
                Icons.picture_as_pdf_outlined,
                color: AppColors.textSecondary,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'لا يوجد PDF للعرض',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'لم يتم إنشاء PDF للفاتورة',
              style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: _generatePDF,
              icon: Icon(Icons.add, size: 18.sp),
              label: Text('إنشاء PDF'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPDFPreview(S s) {
    return Column(
      children: [
        // PDF Info Header
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Icon(
                  Icons.picture_as_pdf,
                  color: AppColors.error,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'فاتورة ${widget.invoice.invoiceNumber}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'تم إنشاء PDF بنجاح',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.success,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'جاهز',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.success,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

        // PDF Preview
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: PdfPreview(
                build: (format) => _pdfBytes!,
                allowPrinting: true,
                allowSharing: true,
                canChangePageFormat: false,
                canChangeOrientation: false,
                canDebug: false,
                maxPageWidth: 700,
                onError: (context, error) {
                  setState(() {
                    _error = 'خطأ في عرض PDF: $error';
                  });
                  return Container();
                },
              ),
            ),
          ),
        ),

        // Action Buttons
        Container(
          padding: EdgeInsets.all(20.w),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _printPDF,
                  icon: Icon(Icons.print, size: 18.sp),
                  label: Text(s.printReceipt),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _generatePDF() async {
    setState(() {
      _isGenerating = true;
      _error = '';
    });

    _loadingAnimationController.forward();

    try {
      // تحضير بيانات الفاتورة
      final invoiceData = {
        'invoiceNumber': widget.invoice.invoiceNumber,
        'issueDate': widget.invoice.issueDate,
        'status': widget.invoice.status,
        'customerName': widget.invoice.customerName,
        'customerEmail': widget.invoice.customer?.email,
        'customerPhone': widget.invoice.customer?.phone,
        'subtotal': widget.invoice.subtotal,
        'taxAmount': widget.invoice.taxAmount,
        'discount': widget.invoice.discount,
        'total': widget.invoice.total,
      };

      print('بيانات الفاتورة: $invoiceData');

      final items =
          widget.invoice.items
              ?.map(
                (item) => {
                  'name': item.name,
                  'quantity': item.quantity,
                  'price': item.price,
                  'total': item.total,
                },
              )
              .toList() ??
          [];

      print('عناصر الفاتورة: $items');

      // إنشاء PDF مباشرة
      print('جاري إنشاء PDF...');
      final pdfBytes = await PrintingService.createInvoicePDF(
        invoiceData: invoiceData,
        items: items,
        isThermal: false,
      );
      print('تم إنشاء PDF بنجاح، الحجم: ${pdfBytes.length} bytes');

      setState(() {
        _pdfBytes = pdfBytes;
        _isGenerating = false;
      });
      print('تم تحديث الحالة، _pdfBytes: ${_pdfBytes != null}');

      final s = S.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(s.pdfGenerated),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    } catch (e) {
      setState(() {
        _error = 'خطأ في إنشاء PDF: $e';
        _isGenerating = false;
      });
    }
  }

  void _savePDF() async {
    if (_pdfBytes == null) return;

    try {
      final filePath = await _controller.createAndSavePDF(widget.invoice);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم حفظ PDF في: $filePath'),
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
          content: Text('خطأ في حفظ PDF: $e'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    }
  }

  void _sharePDF() async {
    if (_pdfBytes == null) return;

    try {
      await _controller.sharePDF(widget.invoice);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ في مشاركة PDF: $e'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    }
  }

  void _printPDF() async {
    if (_pdfBytes == null) return;

    try {
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => _pdfBytes!,
        name: 'فاتورة_${widget.invoice.invoiceNumber}',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ في طباعة PDF: $e'),
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
