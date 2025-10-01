import 'package:invotek/features/home/data/models/menu_item.dart';

class NavigationState {
  final String currentRoute;
  final dynamic routeArguments;
  final List<MenuItem> menuItems;
  final int selectedIndex;
  final int? expandedItemIndex;
  final int? selectedSubIndex;

  NavigationState({
    this.currentRoute = '/home',
    this.routeArguments,
    List<MenuItem>? menuItems,
    this.selectedIndex = 0,
    this.expandedItemIndex,
    this.selectedSubIndex,
  }) : menuItems = menuItems ?? MenuData.getMenuItems();

  NavigationState copyWith({
    String? currentRoute,
    dynamic routeArguments,
    List<MenuItem>? menuItems,
    int? selectedIndex,
    int? expandedItemIndex,
    int? selectedSubIndex,
  }) {
    return NavigationState(
      currentRoute: currentRoute ?? this.currentRoute,
      routeArguments: routeArguments ?? this.routeArguments,
      menuItems: menuItems ?? this.menuItems,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      expandedItemIndex: expandedItemIndex ?? this.expandedItemIndex,
      selectedSubIndex: selectedSubIndex ?? this.selectedSubIndex,
    );
  }
}
