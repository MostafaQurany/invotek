import 'package:invotek/features/home/data/models/menu_item.dart';

class NavigationState {
  final String currentRoute;
  final dynamic routeArguments;
  final List<MenuItem> menuItems;
  final int selectedIndex;
  final int? expandedItemIndex;

  NavigationState({
    this.currentRoute = '/home',
    this.routeArguments,
    List<MenuItem>? menuItems,
    this.selectedIndex = 0,
    this.expandedItemIndex,
  }) : menuItems = menuItems ?? MenuData.getMenuItems();

  NavigationState copyWith({
    String? currentRoute,
    dynamic routeArguments,
    List<MenuItem>? menuItems,
    int? selectedIndex,
    int? expandedItemIndex,
  }) {
    return NavigationState(
      currentRoute: currentRoute ?? this.currentRoute,
      routeArguments: routeArguments ?? this.routeArguments,
      menuItems: menuItems ?? this.menuItems,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      expandedItemIndex: expandedItemIndex ?? this.expandedItemIndex,
    );
  }
}

class NavigationController {
  static final NavigationController _instance =
      NavigationController._internal();
  factory NavigationController() => _instance;
  NavigationController._internal();

  NavigationState _state = NavigationState();
  final List<Function(NavigationState)> _listeners = [];

  NavigationState get state => _state;

  void addListener(Function(NavigationState) listener) {
    _listeners.add(listener);
  }

  void removeListener(Function(NavigationState) listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener(_state);
    }
  }

  void selectMenuItem(int index) {
    if (index >= 0 && index < _state.menuItems.length) {
      final updatedItems = List<MenuItem>.from(_state.menuItems);

      // إلغاء تحديد جميع العناصر
      for (int i = 0; i < updatedItems.length; i++) {
        updatedItems[i] = updatedItems[i].copyWith(isSelected: false);
      }

      // تحديد العنصر المختار
      updatedItems[index] = updatedItems[index].copyWith(isSelected: true);

      _state = _state.copyWith(
        menuItems: updatedItems,
        selectedIndex: index,
        currentRoute: updatedItems[index].route,
        routeArguments: null,
      );
      _notifyListeners();
    }
  }

  void selectMenuItemByRoute(String route, {dynamic arguments}) {
    final index = _state.menuItems.indexWhere((item) => item.route == route);
    if (index != -1) {
      selectMenuItem(index);
    } else {
      // Handle dynamic routes with arguments
      _state = _state.copyWith(currentRoute: route, routeArguments: arguments);
      _notifyListeners();
    }
  }

  MenuItem getSelectedMenuItem() {
    return _state.menuItems[_state.selectedIndex];
  }

  void toggleExpandedItem(int index) {
    if (_state.expandedItemIndex == index) {
      // إغلاق العنصر المفتوح
      _state = _state.copyWith(expandedItemIndex: null);
    } else {
      // فتح العنصر الجديد
      _state = _state.copyWith(expandedItemIndex: index);
    }
    _notifyListeners();
  }

  void selectSubMenuItem(int parentIndex, int subIndex) {
    if (parentIndex >= 0 && parentIndex < _state.menuItems.length) {
      final parentItem = _state.menuItems[parentIndex];
      if (parentItem.hasSubItems &&
          subIndex >= 0 &&
          subIndex < parentItem.subItems.length) {
        final subItem = parentItem.subItems[subIndex];

        // إلغاء تحديد جميع العناصر
        final updatedItems = List<MenuItem>.from(_state.menuItems);
        for (int i = 0; i < updatedItems.length; i++) {
          updatedItems[i] = updatedItems[i].copyWith(isSelected: false);
        }

        // تحديد العنصر الفرعي
        final updatedSubItems = List<MenuItem>.from(parentItem.subItems);
        for (int i = 0; i < updatedSubItems.length; i++) {
          updatedSubItems[i] = updatedSubItems[i].copyWith(
            isSelected: i == subIndex,
          );
        }

        updatedItems[parentIndex] = parentItem.copyWith(
          subItems: updatedSubItems,
          isSelected: false,
        );

        _state = _state.copyWith(
          menuItems: updatedItems,
          selectedIndex: parentIndex,
          currentRoute: subItem.route,
          routeArguments: null,
        );
        _notifyListeners();
      }
    }
  }
}
