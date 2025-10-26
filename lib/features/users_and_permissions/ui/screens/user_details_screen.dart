import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/cards/user_details_header.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/cards/user_summary_card.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/cards/user_info_card.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/cards/user_details_bottom_actions.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/dialogs/delete_user_dialog.dart';

class UserDetailsScreen extends StatefulWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Modern Header with Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration.zero,
              child: UserDetailsHeader(
                user: user,
                onBack: () => Navigator.pop(context),
                onEdit: () => _editUser(),
              ),
            ),
          ),

          // Space with Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 200),
              child: SizedBox(height: 16.h),
            ),
          ),

          // Content Cards with Staggered Animation
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: StaggeredAnimatedList(
                staggerDelay: Duration(milliseconds: 150),
                children: [
                  UserSummaryCard(user: user),
                  SizedBox(height: 16.h),
                  UserInfoCard(user: user, onCopyToClipboard: _copyToClipboard),
                  SizedBox(height: 15.h), // Space for bottom actions
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Actions with Animation
      bottomNavigationBar: AnimatedEntryWidget(
        delay: Duration(milliseconds: 800),
        child: UserDetailsBottomActions(
          onDelete: () => _showDeleteConfirmation(),
          onEdit: () => _editUser(),
        ),
      ),
    );
  }

  // Helper Methods
  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _editUser() {
    Navigator.pushNamed(context, '/users/edit', arguments: widget.user);
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => DeleteUserDialog(
        user: widget.user,
        onConfirm: () {
          final usersCubit = BlocProvider.of<UsersCubit>(context);
          usersCubit.deleteUser(widget.user.id!);
          Navigator.pop(context, 'deleted'); // Go back to list with result
        },
      ),
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
