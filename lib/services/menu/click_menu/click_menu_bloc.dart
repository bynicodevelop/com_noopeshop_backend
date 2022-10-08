// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";

part "click_menu_event.dart";
part "click_menu_state.dart";

class ClickMenuBloc extends Bloc<ClickMenuEvent, ClickMenuState> {
  final Map<String, dynamic> defaultMenu;

  ClickMenuBloc(this.defaultMenu)
      : super(ClickMenuInitialState(
          menu: defaultMenu,
        )) {
    on<OnClickMenuEvent>((event, emit) {
      emit(ClickMenuInitialState(
        menu: event.menu,
      ));
    });
  }
}
