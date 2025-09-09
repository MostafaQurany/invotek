import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';

class AnimatedCard extends StatelessWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset offset;
  final Curve curve;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const AnimatedCard({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 600),
    this.offset = const Offset(0, 0.3),
    this.curve = Curves.easeOutCubic,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedEntryWidget(
      delay: delay,
      duration: duration,
      offset: offset,
      curve: curve,
      child: Container(
        margin: margin,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
          ),
          child: Padding(
            padding: padding ?? EdgeInsets.all(20.w),
            child: child,
          ),
        ),
      ),
    );
  }
}
