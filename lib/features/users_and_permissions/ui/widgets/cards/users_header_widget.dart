import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/common_search_bar.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/forms/role_dropdown.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/forms/status_dropdown.dart';

class UsersHeaderWidget extends StatefulWidget {
  final VoidCallback onMenuPressed;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final String selectedRole;
  final String selectedStatus;
  final ValueChanged<String?> onRoleChanged;
  final ValueChanged<String?> onStatusChanged;

  const UsersHeaderWidget({
    super.key,
    required this.onMenuPressed,
    required this.searchController,
    required this.onSearchChanged,
    required this.selectedRole,
    required this.selectedStatus,
    required this.onRoleChanged,
    required this.onStatusChanged,
  });

  @override
  State<UsersHeaderWidget> createState() => _UsersHeaderWidgetState();
}

class _UsersHeaderWidgetState extends State<UsersHeaderWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  final bool _isFiltersExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withOpacity(0.9),
                  ],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar with Menu and Title
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
                      child: Row(
                        children: [
                          // Menu Button
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: IconButton(
                              onPressed: widget.onMenuPressed,
                              icon: Icon(
                                Icons.menu_rounded,
                                color: AppColors.white,
                                size: 24.sp,
                              ),
                              padding: EdgeInsets.all(8.w),
                            ),
                          ),
                          SizedBox(width: 16.w),

                          // Title and Subtitle
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Users Management',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Manage users and permissions',
                                  style: TextStyle(
                                    color: AppColors.white.withOpacity(0.8),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Search Bar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CommonSearchBar(
                        controller: widget.searchController,
                        hintText: 'Search users',
                        onChanged: widget.onSearchChanged,
                        backgroundColor: AppColors.white,
                        borderRadius: 16.r,
                        prefixIcon: Icons.search_rounded,
                        suffixIcon: Icons.tune_rounded,
                      ),
                    ),

                    // Animated Filters Section
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      height: _isFiltersExpanded ? null : 0,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _isFiltersExpanded ? 1.0 : 0.0,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
                          child: Row(
                            children: [
                              // Role Filter
                              Expanded(
                                child: RoleDropdown(
                                  value: widget.selectedRole,
                                  onChanged: widget.onRoleChanged,
                                  backgroundColor: AppColors.white,
                                ),
                              ),
                              SizedBox(width: 12.w),

                              // Status Filter
                              Expanded(
                                child: StatusDropdown(
                                  value: widget.selectedStatus,
                                  onChanged: widget.onStatusChanged,
                                  backgroundColor: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 28.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
