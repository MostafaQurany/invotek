import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:invotek/generated/l10n.dart';

class UsersDeleteDialog extends StatelessWidget {
  final User user;
  final VoidCallback onDelete;

  const UsersDeleteDialog({
    super.key,
    required this.user,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).deleteConfirmation,
        style: TextStyle(fontSize: 16.sp),
      ),
      content: Text(
        S.of(context).deleteUserConfirmation(user.name ?? ''),
        style: TextStyle(fontSize: 14.sp),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(S.of(context).cancel, style: TextStyle(fontSize: 12.sp)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onDelete();
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: Text(S.of(context).delete, style: TextStyle(fontSize: 12.sp)),
        ),
      ],
    );
  }
}
