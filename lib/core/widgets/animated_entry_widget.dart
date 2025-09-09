import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedEntryWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset offset;
  final Curve curve;

  const AnimatedEntryWidget({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 600),
    this.offset = const Offset(0, 0.3),
    this.curve = Curves.easeOutCubic,
  });

  @override
  State<AnimatedEntryWidget> createState() => _AnimatedEntryWidgetState();
}

class _AnimatedEntryWidgetState extends State<AnimatedEntryWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _slideAnimation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    // Start animation after delay
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: widget.child,
          ),
        );
      },
    );
  }
}

// Convenience widget for staggered animations
class StaggeredAnimatedList extends StatelessWidget {
  final List<Widget> children;
  final Duration staggerDelay;
  final Duration animationDuration;
  final Offset slideOffset;
  final Curve curve;

  const StaggeredAnimatedList({
    super.key,
    required this.children,
    this.staggerDelay = const Duration(milliseconds: 100),
    this.animationDuration = const Duration(milliseconds: 600),
    this.slideOffset = const Offset(0, 0.3),
    this.curve = Curves.easeOutCubic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final child = entry.value;
        
        return AnimatedEntryWidget(
          delay: Duration(milliseconds: index * staggerDelay.inMilliseconds),
          duration: animationDuration,
          offset: slideOffset,
          curve: curve,
          child: child,
        );
      }).toList(),
    );
  }
}

// Convenience widget for single animated entry
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
            side: BorderSide(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
            ),
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
