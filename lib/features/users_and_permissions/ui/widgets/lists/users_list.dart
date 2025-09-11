import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/cards/user_card.dart';

class UsersList extends StatelessWidget {
  final List<User> users;
  final Function(User) onUserTap;
  final Function(User)? onUserView;
  final Function(User)? onUserEdit;
  final Function(User)? onUserDelete;
  final VoidCallback? onAddUser;
  final VoidCallback? onRetry;
  final String? selectedRole;
  final String? selectedStatus;
  final ValueChanged<String?>? onRoleChanged;
  final ValueChanged<String?>? onStatusChanged;
  final bool isLoadingMore;
  final ScrollController? scrollController;

  const UsersList({
    super.key,
    required this.users,
    required this.onUserTap,
    this.onUserView,
    this.onUserEdit,
    this.onUserDelete,
    this.onAddUser,
    this.onRetry,
    this.selectedRole,
    this.selectedStatus,
    this.onRoleChanged,
    this.onStatusChanged,
    this.isLoadingMore = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Users Count Header
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Text(
                  'Users (${users.length})',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '${users.length} Total',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Users List
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: users.length + (isLoadingMore ? 1 : 0),
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                if (index == users.length && isLoadingMore) {
                  return Container(
                    padding: EdgeInsets.all(16.w),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                final user = users[index];
                return UserCard(user: user, onTap: () => onUserTap(user));
              },
            ),
          ),
        ],
      ),
    );
  }
}
