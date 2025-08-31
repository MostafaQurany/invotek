import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/home/data/models/menu_item.dart';

class MenuState {
  final List<MenuItem> menuItems;
  final int selectedIndex;
  final String currentRoute;
  final int? expandedItemIndex;
  final dynamic routeArguments;

  MenuState({
    required this.menuItems,
    this.selectedIndex = 0,
    this.currentRoute = '/home',
    this.expandedItemIndex,
    this.routeArguments,
  });

  MenuState copyWith({
    List<MenuItem>? menuItems,
    int? selectedIndex,
    String? currentRoute,
    int? expandedItemIndex,
    dynamic routeArguments,
  }) {
    return MenuState(
      menuItems: menuItems ?? this.menuItems,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      currentRoute: currentRoute ?? this.currentRoute,
      expandedItemIndex: expandedItemIndex ?? this.expandedItemIndex,
      routeArguments: routeArguments ?? this.routeArguments,
    );
  }

  factory MenuState.initial() => MenuState(menuItems: MenuData.getMenuItems());
}

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState.initial());

  void selectMenuItem(int index) {
    if (isClosed) return;

    if (index >= 0 && index < state.menuItems.length) {
      final updatedItems = List<MenuItem>.from(state.menuItems);

      // إلغاء تحديد جميع العناصر
      for (int i = 0; i < updatedItems.length; i++) {
        updatedItems[i] = updatedItems[i].copyWith(isSelected: false);
      }

      // تحديد العنصر المختار
      updatedItems[index] = updatedItems[index].copyWith(isSelected: true);

      emit(
        state.copyWith(
          menuItems: updatedItems,
          selectedIndex: index,
          currentRoute: updatedItems[index].route,
          routeArguments: null,
        ),
      );
    }
  }

  void selectMenuItemByRoute(String route, {dynamic arguments}) {
    if (isClosed) return;

    final index = state.menuItems.indexWhere((item) => item.route == route);
    if (index != -1) {
      selectMenuItem(index);
    } else {
      // Handle dynamic routes with arguments
      emit(state.copyWith(currentRoute: route, routeArguments: arguments));
    }
  }

  MenuItem getSelectedMenuItem() {
    return state.menuItems[state.selectedIndex];
  }

  void toggleExpandedItem(int index) {
    if (isClosed) return;

    if (state.expandedItemIndex == index) {
      // إغلاق العنصر المفتوح
      emit(state.copyWith(expandedItemIndex: null));
    } else {
      // فتح العنصر الجديد
      emit(state.copyWith(expandedItemIndex: index));
    }
  }

  void selectSubMenuItem(int parentIndex, int subIndex) {
    if (isClosed) return;

    if (parentIndex >= 0 && parentIndex < state.menuItems.length) {
      final parentItem = state.menuItems[parentIndex];
      if (parentItem.hasSubItems &&
          subIndex >= 0 &&
          subIndex < parentItem.subItems.length) {
        final subItem = parentItem.subItems[subIndex];

        // إلغاء تحديد جميع العناصر
        final updatedItems = List<MenuItem>.from(state.menuItems);
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

        emit(
          state.copyWith(
            menuItems: updatedItems,
            selectedIndex: parentIndex,
            currentRoute: subItem.route,
            routeArguments: null,
          ),
        );
      }
    }
  }
}
