import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  SearchBarDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }

  @override
  double get maxExtent => 120.0.h;

  @override
  double get minExtent => 120.0.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
