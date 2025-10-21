import 'package:flutter/material.dart';

/// Wrapper widget that keeps screens alive in memory for better performance
class KeepAliveScreenWrapper extends StatefulWidget {
  final Widget child;
  final String route;

  const KeepAliveScreenWrapper({
    super.key,
    required this.child,
    required this.route,
  });

  @override
  State<KeepAliveScreenWrapper> createState() => _KeepAliveScreenWrapperState();
}

class _KeepAliveScreenWrapperState extends State<KeepAliveScreenWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
