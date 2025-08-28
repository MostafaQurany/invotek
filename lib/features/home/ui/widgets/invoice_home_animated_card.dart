import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/home/ui/widgets/animated_fade_slide_card.dart';
import 'package:invotek/features/home/ui/widgets/invoice_home_cards.dart';

class InvoiceHomeAnimatedCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isVisible;
  final Offset offset;
  final void Function()? ontTap;
  final Color color;
  final Color textColor;
  final BorderRadius borderRadius;
  const InvoiceHomeAnimatedCard({
    required this.ontTap,
    required this.offset,
    required this.isVisible,
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.color,
    this.textColor = AppColors.white,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeSlideCard(
      offset: offset,
      visible: isVisible,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOutCubicEmphasized,
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOutCubicEmphasized,
        child: InvoiceHomeCards(
          title: title,
          description: description,
          onTap: ontTap,
          color: color,
          borderColor: color,
          textColor: textColor,
          image: image,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
