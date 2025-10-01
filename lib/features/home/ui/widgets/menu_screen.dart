import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/features/home/data/models/menu_item.dart';
import 'package:invotek/features/home/data/models/navigation_state.dart';
import 'package:invotek/features/home/ui/home_screen_with_drawer.dart';
import 'package:invotek/generated/l10n.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  NavigationState _currentState = NavigationState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildMenuItems()),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: AppColors.primary),
          ),
          const SizedBox(height: 10),
          Text(
            'Invotek',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return ListView.builder(
      itemCount: _currentState.menuItems.length,
      itemBuilder: (context, index) {
        final item = _currentState.menuItems[index];
        return _buildMenuItem(item, index);
      },
    );
  }

  Widget _buildMenuItem(MenuItem item, int index) {
    final isSelected = _currentState.selectedIndex == index;
    final isExpanded = _currentState.expandedItemIndex == index;

    return Column(
      children: [
        ListTile(
          leading: Icon(
            item.icon,
            color: isSelected ? AppColors.primary : Colors.white,
          ),
          title: Text(
            item.getLocalizedTitle(S.of(context)),
            style: TextStyle(
              color: isSelected ? AppColors.primary : Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          trailing: item.hasSubItems
              ? Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                )
              : null,
          onTap: () => _onMenuItemTap(item, index),
        ),
        if (item.hasSubItems && isExpanded)
          _buildSubMenuItems(item.subItems, index),
      ],
    );
  }

  Widget _buildSubMenuItems(List<MenuItem> subItems, int parentIndex) {
    return Container(
      color: Colors.white.withOpacity(0.1),
      child: Column(
        children: subItems.asMap().entries.map((entry) {
          final subIndex = entry.key;
          final subItem = entry.value;
          final isSubSelected =
              _currentState.selectedIndex == parentIndex &&
              _currentState.selectedSubIndex == subIndex;

          return ListTile(
            leading: Icon(
              subItem.icon,
              color: isSubSelected ? AppColors.primary : Colors.white70,
              size: 20,
            ),
            title: Text(
              subItem.getLocalizedTitle(S.of(context)),
              style: TextStyle(
                color: isSubSelected ? AppColors.primary : Colors.white70,
                fontWeight: isSubSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
            onTap: () => _onSubMenuItemTap(subItem, parentIndex, subIndex),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Divider(color: Colors.white.withOpacity(0.3)),
          const SizedBox(height: 10),
          Text(
            'الإصدار 1.0.0',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _onMenuItemTap(MenuItem item, int index) {
    if (item.hasSubItems) {
      // تبديل حالة التوسيع
      setState(() {
        _currentState = _currentState.copyWith(
          expandedItemIndex: _currentState.expandedItemIndex == index
              ? null
              : index,
          selectedIndex: index,
          selectedSubIndex: null,
        );
      });
    } else {
      // التنقل إلى الشاشة
      _navigateToScreen(item.route);
    }
  }

  void _onSubMenuItemTap(MenuItem subItem, int parentIndex, int subIndex) {
    setState(() {
      _currentState = _currentState.copyWith(
        selectedIndex: parentIndex,
        selectedSubIndex: subIndex,
        expandedItemIndex: parentIndex,
      );
    });
    _navigateToScreen(subItem.route);
  }

  void _navigateToScreen(String route) {
    // إغلاق الدرج
    ZoomDrawer.of(context)?.close();

    // استخدام Navigator.pushReplacementNamed بدلاً من findAncestorStateOfType
    Navigator.pushReplacementNamed(context, route);
  }
}
