import 'package:flutter/material.dart';

class AnimatedFadeSlideCard extends StatelessWidget {
  final Offset offset;
  final bool visible;
  final Duration duration;
  final Curve curve;
  final Widget child;

  const AnimatedFadeSlideCard({
    super.key,
    required this.offset,
    required this.visible,
    required this.duration,
    required this.curve,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: visible ? Offset.zero : offset,
      duration: duration,
      curve: curve,
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: duration,
        curve: curve,
        child: child,
      ),
    );
  }
}
