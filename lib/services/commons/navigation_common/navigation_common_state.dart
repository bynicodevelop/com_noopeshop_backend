part of "navigation_common_bloc.dart";

abstract class NavigationCommonState extends Equatable {
  const NavigationCommonState();

  @override
  List<Object> get props => [];
}

class NavigationCommonInitialState extends NavigationCommonState {
  final int index;
  final Map<String, dynamic> data;

  const NavigationCommonInitialState({
    this.index = 0,
    this.data = const {},
  });

  @override
  List<Object> get props => [
        index,
        data,
      ];
}
