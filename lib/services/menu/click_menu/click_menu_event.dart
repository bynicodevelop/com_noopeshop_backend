part of "click_menu_bloc.dart";

abstract class ClickMenuEvent extends Equatable {
  const ClickMenuEvent();

  @override
  List<Object> get props => [];
}

class OnClickMenuEvent extends ClickMenuEvent {
  final Map<String, dynamic> menu;

  const OnClickMenuEvent(
    this.menu,
  );

  @override
  List<Object> get props => [
        menu,
      ];
}
