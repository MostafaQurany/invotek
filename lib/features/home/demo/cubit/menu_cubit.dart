import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/home/data/models/menu_item.dart';

class MenuState {
  final List<MenuItem> menuItems;
  final int selectedIndex;
  final String currentRoute;

  MenuState({
    required this.menuItems,
    this.selectedIndex = 0,
    this.currentRoute = '/home',
  });

  MenuState copyWith({
    List<MenuItem>? menuItems,
    int? selectedIndex,
    String? currentRoute,
  }) {
    return MenuState(
      menuItems: menuItems ?? this.menuItems,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }

  factory MenuState.initial() => MenuState(menuItems: MenuData.getMenuItems());
}

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState.initial());

  void selectMenuItem(int index) {
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
        ),
      );
    }
  }

  void selectMenuItemByRoute(String route) {
    final index = state.menuItems.indexWhere((item) => item.route == route);
    if (index != -1) {
      selectMenuItem(index);
    }
  }

  MenuItem getSelectedMenuItem() {
    return state.menuItems[state.selectedIndex];
  }
}
