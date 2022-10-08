part of "click_menu_bloc.dart";

abstract class ClickMenuState extends Equatable {
  const ClickMenuState();

  @override
  List<Object> get props => [];
}

class ClickMenuInitialState extends ClickMenuState {
  final Map<String, dynamic> menu;

  const ClickMenuInitialState({
    required this.menu,
  });

  @override
  List<Object> get props => [
        menu,
      ];
}
