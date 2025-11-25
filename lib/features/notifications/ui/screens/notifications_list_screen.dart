import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/common_search_bar.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/notifications/data/models/response/get_notification_stats_response.dart';
import 'package:invotek/features/notifications/domain/entities/notification_entity.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_cubit.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_state.dart';
import 'package:invotek/features/notifications/ui/widgets/cards/notification_stats_card.dart';
import 'package:invotek/features/notifications/ui/widgets/dialogs/delete_notification_dialog.dart';
import 'package:invotek/features/notifications/ui/widgets/lists/notifications_list_builder.dart';
import 'package:invotek/generated/l10n.dart';

class NotificationsListScreen extends StatefulWidget {
  const NotificationsListScreen({super.key});

  @override
  State<NotificationsListScreen> createState() =>
      _NotificationsListScreenState();
}

class NotificationsListScreenWithProvider extends StatelessWidget {
  const NotificationsListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<NotificationsCubit>(),
      child: const NotificationsListScreen(),
    );
  }
}

class _NotificationsListScreenState extends State<NotificationsListScreen>
    with SingleTickerProviderStateMixin {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  late TabController _tabController;
  Timer? _debounceTimer;
  String _currentTab = 'all';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
    context.read<NotificationsCubit>().loadNotificationStats();
    context.read<NotificationsCubit>().loadNotifications(isRefresh: true);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _tabController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    setState(() {
      switch (_tabController.index) {
        case 0:
          _currentTab = 'all';
          break;
        case 1:
          _currentTab = 'read';
          break;
        case 2:
          _currentTab = 'unread';
          break;
      }
    });
    _loadNotificationsForTab();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final cubit = context.read<NotificationsCubit>();
      if (cubit.hasMorePages) {
        cubit.loadMoreNotifications();
      }
    }
  }

  void _loadNotificationsForTab() {
    final cubit = context.read<NotificationsCubit>();
    final search = _searchController.text.isEmpty
        ? null
        : _searchController.text;
    final isRead = _currentTab == 'read'
        ? true
        : _currentTab == 'unread'
        ? false
        : null;

    cubit.loadNotifications(isRefresh: true, search: search, isRead: isRead);
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      if (query.length >= 2 || query.isEmpty) {
        _loadNotificationsForTab();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final canPop = Navigator.of(context).canPop();
          if (canPop) {
            // السماح بالرجوع العادي بدون dialog
            Navigator.of(context).pop();
          } else {
            // فتح zoomDrawer والانتقال إلى home
            try {
              final zoomDrawer = ZoomDrawer.of(context);
              if (zoomDrawer != null) {
                // إغلاق zoomDrawer إذا كان مفتوحاً
                if (zoomDrawer.isOpen()) {
                  zoomDrawer.close();
                }
                // الانتقال إلى home باستخدام NavigationCubit
                context.read<NavigationCubit>().navigateToRoute(
                  AppRoutes.homeRoute,
                );
              } else {
                // Fallback: الانتقال إلى home مباشرة
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
              }
            } catch (e) {
              // Fallback: الانتقال إلى home مباشرة
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            s.notifications,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: AppColors.white),
              onSelected: (value) {
                switch (value) {
                  case 'mark_all_read':
                    _markAllAsRead();
                    break;
                  case 'clear_read':
                    _clearReadNotifications();
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'mark_all_read',
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline, size: 18.sp),
                      SizedBox(width: 8.w),
                      Text(s.notificationsMarkAllAsRead),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'clear_read',
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_sweep_outlined,
                        size: 18.sp,
                        color: AppColors.error,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        s.notificationsClearRead,
                        style: TextStyle(color: AppColors.error),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: BlocListener<NotificationsCubit, NotificationsState>(
          listener: (context, state) {
            state.maybeWhen(
              markAllAsReadSuccess:
                  (
                    notifications,
                    selectedNotification,
                    currentPage,
                    totalPages,
                    stats,
                  ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(s.notificationsMarkAllAsReadSuccess),
                        backgroundColor: AppColors.success,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                  },
              clearReadSuccess:
                  (
                    notifications,
                    selectedNotification,
                    currentPage,
                    totalPages,
                    stats,
                  ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(s.notificationsClearReadSuccess),
                        backgroundColor: AppColors.success,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                  },
              deleteSuccess:
                  (
                    notifications,
                    deletedId,
                    selectedNotification,
                    currentPage,
                    totalPages,
                    stats,
                  ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(s.notificationsDeleteSuccess),
                        backgroundColor: AppColors.success,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                  },
              markAsReadSuccess:
                  (
                    notifications,
                    notificationId,
                    selectedNotification,
                    currentPage,
                    totalPages,
                    stats,
                  ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(s.notificationsMarkAsReadSuccess),
                        backgroundColor: AppColors.success,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                  },
              orElse: () {},
            );
          },
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<NotificationsCubit>().refreshNotifications();
              context.read<NotificationsCubit>().loadNotificationStats(forceRefresh: true);
            },
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: CommonSearchBar(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    hintText: s.notificationsSearchHint,
                    prefixIcon: Icons.search,
                  ),
                ),
                // Stats Card
                BlocBuilder<NotificationsCubit, NotificationsState>(
                  builder: (context, state) {
                    GetNotificationStatsResponse? stats;
                    state.maybeWhen(
                      statsLoaded: (_, __, ___, ____, stats_) => stats = stats_,
                      loaded: (_, __, ___, ____, stats_) => stats = stats_,
                      orElse: () {},
                    );
                    return NotificationStatsCard(stats: stats);
                  },
                ),
                // Tabs
                Container(
                  color: AppColors.white,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.primary,
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.greyDark,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    tabs: [
                      Tab(text: s.notificationsAll),
                      Tab(text: s.notificationsRead),
                      Tab(text: s.notificationsUnread),
                    ],
                  ),
                ),
                // Notifications List
                Expanded(
                  child: Container(
                    color: AppColors.white,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        NotificationsListBuilder(
                          tabType: 'all',
                          onNotificationTap: (notification) =>
                              _navigateToDetails(notification),
                          onDelete: (notification) =>
                              _showDeleteDialog(notification),
                          onMarkAsRead: (notification) =>
                              _markAsRead(notification),
                          scrollController: _scrollController,
                        ),
                        NotificationsListBuilder(
                          tabType: 'read',
                          onNotificationTap: (notification) =>
                              _navigateToDetails(notification),
                          onDelete: (notification) =>
                              _showDeleteDialog(notification),
                          onMarkAsRead: (notification) =>
                              _markAsRead(notification),
                          scrollController: _scrollController,
                        ),
                        NotificationsListBuilder(
                          tabType: 'unread',
                          onNotificationTap: (notification) =>
                              _navigateToDetails(notification),
                          onDelete: (notification) =>
                              _showDeleteDialog(notification),
                          onMarkAsRead: (notification) =>
                              _markAsRead(notification),
                          scrollController: _scrollController,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToDetails(NotificationEntity notification) {
    Navigator.pushNamed(
      context,
      AppRoutes.notificationDetailsRoute,
      arguments: notification,
    );
  }

  void _showDeleteDialog(NotificationEntity notification) {
    showDialog(
      context: context,
      builder: (context) => DeleteNotificationDialog(
        onConfirm: () {
          context.read<NotificationsCubit>().deleteNotification(
            notification.id,
          );
        },
      ),
    );
  }

  void _markAsRead(NotificationEntity notification) {
    if (!notification.isRead) {
      context.read<NotificationsCubit>().markNotificationAsRead(
        notification.id,
      );
    }
  }

  void _markAllAsRead() {
    context.read<NotificationsCubit>().markAllNotificationsAsRead();
  }

  void _clearReadNotifications() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).notificationsClearRead),
        content: Text(S.of(context).notificationsClearReadConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<NotificationsCubit>().clearReadNotifications();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.white,
            ),
            child: Text(S.of(context).delete),
          ),
        ],
      ),
    );
  }
}
