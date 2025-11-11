import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 35.h),
        // // Users Count Header
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16.w),
        //
        //   child: Row(
        //     children: [
        //       Text(
        //         'Users (${users.length})',
        //         style: TextStyle(
        //           fontSize: 18.sp,
        //           fontWeight: FontWeight.w600,
        //           color: AppColors.textPrimary,
        //         ),
        //       ),
        //       const Spacer(),
        //       Container(
        //         padding: EdgeInsets.symmetric(
        //           horizontal: 12.w,
        //           vertical: 6.h,
        //         ),
        //         decoration: BoxDecoration(
        //           color: AppColors.primary.withOpacity(0.1),
        //           borderRadius: BorderRadius.circular(20.r),
        //         ),
        //         child: Text(
        //           '${users.length} Total',
        //           style: TextStyle(
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.w500,
        //             color: AppColors.primary,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        //SizedBox(height: 15.h),
        // Users List - Using ListView.builder for memory efficiency
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: users.length + (isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == users.length && isLoadingMore) {
                return Container(
                  padding: EdgeInsets.all(16.w),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }

              final user = users[index];
              print(index);
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: UserCard(user: user, onTap: () => onUserTap(user)),
              );
            },
          ),
        ),
      ],
    );
  }
}
