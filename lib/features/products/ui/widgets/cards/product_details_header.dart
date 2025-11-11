import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class ProductDetailsHeader extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onBack;
  final VoidCallback onEdit;

  const ProductDetailsHeader({
    super.key,
    required this.product,
    required this.onBack,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return AnimatedEntryWidget(
      delay: Duration.zero,
      child: Container(
        height: 220.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.primary.withOpacity(0.6)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.r),
            bottomRight: Radius.circular(32.r),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Bar
                Row(
                  children: [
                    IconButton(
                      onPressed: onBack,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: onEdit,
                      icon: Icon(
                        Icons.edit_outlined,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Title
                Text(
                  s.productsProductDetails,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  s.productsViewAndManageProductInformation,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
