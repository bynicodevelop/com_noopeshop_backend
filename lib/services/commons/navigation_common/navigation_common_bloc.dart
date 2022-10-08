// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";

part "navigation_common_event.dart";
part "navigation_common_state.dart";

class NavigationCommonBloc
    extends Bloc<NavigationCommonEvent, NavigationCommonState> {
  NavigationCommonBloc() : super(NavigationCommonInitialState()) {
    on<OnNavigationCommonEvent>((event, emit) {});
  }
}
