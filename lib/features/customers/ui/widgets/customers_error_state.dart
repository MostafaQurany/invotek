import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class CustomersErrorState extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const CustomersErrorState({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80.sp,
            color: Colors.red,
          ),
          SizedBox(height: 16.h),
          Text(s.errorOccurred(error)),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(s.retry),
          ),
        ],
      ),
    );
  }
}
