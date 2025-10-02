import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/home/data/models/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState());

  void navigateToRoute(String route, {dynamic arguments}) {
    emit(state.copyWith(currentRoute: route, routeArguments: arguments));
  }

  void setSelectedMenuItem(int index, {int? subIndex}) {
    emit(state.copyWith(selectedIndex: index, selectedSubIndex: subIndex));
  }

  void expandMenuItem(int index) {
    final isCurrentlyExpanded = state.expandedItemIndex == index;
    emit(
      state.copyWith(
        expandedItemIndex: isCurrentlyExpanded ? null : index,
        selectedSubIndex: isCurrentlyExpanded ? null : state.selectedSubIndex,
      ),
    );
  }

  void collapseAllItems() {
    emit(state.copyWith(expandedItemIndex: null, selectedSubIndex: null));
  }

  void resetNavigation() {
    emit(NavigationState());
  }
}
