import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/user_list_item_widget.dart';

class UsersListWidget extends StatelessWidget {
  final List<User> users;
  final ScrollController scrollController;
  final bool isLoadingMore;
  final VoidCallback? onUserTap;
  final VoidCallback? onUserEdit;
  final Function(User)? onUserDelete;

  const UsersListWidget({
    super.key,
    required this.users,
    required this.scrollController,
    this.isLoadingMore = false,
    this.onUserTap,
    this.onUserEdit,
    this.onUserDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.all(12.w),
      itemCount: users.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == users.length) {
          return _buildLoadingMoreWidget();
        }

        return Container(
          margin: EdgeInsets.only(bottom: 6.h),
          child: UserListItemWidget(
            user: users[index],
            onTap: onUserTap,
            onEdit: onUserEdit,
            onDelete: () => onUserDelete?.call(users[index]),
          ),
        );
      },
    );
  }

  Widget _buildLoadingMoreWidget() {
    return Container(
      padding: EdgeInsets.all(12.w),
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
    );
  }
}
