import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/printing/services/thermal_printer_service.dart';
import 'package:invotek/generated/l10n.dart';

class PrinterDiscoveryWidget extends StatefulWidget {
  final Function(String ip, int port)? onPrinterSelected;
  final bool showTestButton;

  const PrinterDiscoveryWidget({
    super.key,
    this.onPrinterSelected,
    this.showTestButton = true,
  });

  @override
  State<PrinterDiscoveryWidget> createState() => _PrinterDiscoveryWidgetState();
}

class _PrinterDiscoveryWidgetState extends State<PrinterDiscoveryWidget>
    with TickerProviderStateMixin {
  bool _isDiscovering = false;
  List<dynamic> _discoveredPrinters = [];
  String _error = '';
  late AnimationController _discoveryAnimationController;
  late Animation<double> _discoveryAnimation;

  @override
  void initState() {
    super.initState();
    _discoveryAnimationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _discoveryAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _discoveryAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _discoveryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.search, color: AppColors.primary, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                s.selectPrinter,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Spacer(),
              if (_isDiscovering)
                AnimatedBuilder(
                  animation: _discoveryAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _discoveryAnimation.value,
                      child: SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),

          SizedBox(height: 16.h),

          if (_discoveredPrinters.isEmpty && !_isDiscovering && _error.isEmpty)
            _buildNoPrintersFound(s)
          else if (_discoveredPrinters.isNotEmpty)
            _buildPrintersList()
          else if (_error.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.error.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      _error,
                      style: TextStyle(fontSize: 12.sp, color: AppColors.error),
                    ),
                  ),
                ],
              ),
            ),

          SizedBox(height: 16.h),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _isDiscovering ? null : _discoverPrinters,
              icon: Icon(Icons.refresh, size: 18.sp),
              label: Text(s.refreshPrinters),
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
    );
  }

  Widget _buildNoPrintersFound(S s) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.greyLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(
            Icons.print_disabled,
            color: AppColors.textSecondary,
            size: 32.sp,
          ),
          SizedBox(height: 8.h),
          Text(
            s.noPrintersFound,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
          ),
          SizedBox(height: 4.h),
          Text(
            'تأكد من أن الطابعة متصلة بالشبكة',
            style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildPrintersList() {
    return Column(
      children: _discoveredPrinters
          .map(
            (printer) => Container(
              margin: EdgeInsets.only(bottom: 8.h),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.border),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _selectPrinter(printer),
                  borderRadius: BorderRadius.circular(8.r),
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Icon(
                            Icons.print,
                            color: AppColors.primary,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (printer as dynamic)?.name ??
                                    'طابعة غير معروفة',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                '${(printer as dynamic)?.address}:${(printer as dynamic)?.port}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.showTestButton) ...[
                          IconButton(
                            onPressed: () => _testPrinter(printer),
                            icon: Icon(Icons.play_arrow),
                            color: AppColors.success,
                            iconSize: 20.sp,
                          ),
                        ],
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
            ),
          )
          .toList(),
    );
  }

  void _discoverPrinters() async {
    setState(() {
      _isDiscovering = true;
      _error = '';
    });

    _discoveryAnimationController.repeat();

    try {
      final printers = await ThermalPrinterService.discoverNetworkPrinters();
      setState(() {
        _discoveredPrinters = printers;
        _isDiscovering = false;
      });
    } catch (e) {
      setState(() {
        _error = 'خطأ في اكتشاف الطابعات: $e';
        _discoveredPrinters = [];
        _isDiscovering = false;
      });
    } finally {
      _discoveryAnimationController.stop();
    }
  }

  void _testPrinter(dynamic printer) async {
    try {
      final isAvailable = await ThermalPrinterService.testConnection(
        (printer as dynamic)?.address ?? '',
        (printer as dynamic)?.port ?? 9100,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isAvailable ? 'الطابعة متاحة' : 'الطابعة غير متاحة'),
          backgroundColor: isAvailable ? AppColors.success : AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ في اختبار الطابعة: $e'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    }
  }

  void _selectPrinter(dynamic printer) {
    if (widget.onPrinterSelected != null) {
      widget.onPrinterSelected!(
        (printer as dynamic)?.address ?? '',
        (printer as dynamic)?.port ?? 9100,
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تم اختيار الطابعة: ${(printer as dynamic)?.name ?? (printer as dynamic)?.address}',
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }
}
