import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';

/// A section with header and list of tiles
class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> tiles;
  final bool showDividers;

  const SettingsSection({
    super.key,
    required this.title,
    required this.tiles,
    this.showDividers = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Text(
            title,
            style: AppTextTheme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (showDividers) Divider(height: 1, color: AppColors.border),
        ...List.generate(
          tiles.length,
          (index) => Column(
            children: [
              tiles[index],
              if (showDividers && index < tiles.length - 1)
                Divider(height: 1, color: AppColors.border, indent: 56.w),
            ],
          ),
        ),
      ],
    );
  }
}
