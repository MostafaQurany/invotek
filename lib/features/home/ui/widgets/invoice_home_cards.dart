import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class InvoiceHomeCards extends StatelessWidget {
  final String? title;
  final String? image;
  final String? description;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  const InvoiceHomeCards({
    super.key,
    this.title,
    this.image,
    this.description,
    this.onTap,
    this.color,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        gradient: LinearGradient(
          colors: [
            color?.withValues(alpha: 0.3) ?? AppColors.whiteGray,
            color?.withValues(alpha: 0.5) ?? AppColors.whiteGray,
            color?.withValues(alpha: 0.7) ?? AppColors.whiteGray,
            color?.withValues(alpha: 0.9) ?? AppColors.whiteGray,
            color ?? AppColors.whiteGray,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.1, 0.2, 0.4, 0.5],
        ),
        borderRadius: borderRadius,
        border: Border.all(color: borderColor ?? Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (image != null)
            Positioned(
              top: 15,
              right: -10,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(30 / 360),
                child: Image.asset(
                  color: AppColors.whiteGray.withValues(alpha: 0.3),
                  image!,
                  width: 80.w,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                if (description != null)
                  Expanded(
                    child: Text(
                      description!,
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
