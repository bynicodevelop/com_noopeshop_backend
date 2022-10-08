part of "navigation_common_bloc.dart";

abstract class NavigationCommonEvent extends Equatable {
  const NavigationCommonEvent();

  @override
  List<Object> get props => [];
}

class OnNavigationCommonEvent extends NavigationCommonEvent {
  final String screenName;
  final Map<String, dynamic> data;

  const OnNavigationCommonEvent({
    required this.screenName,
    required this.data,
  });

  @override
  List<Object> get props => [
        screenName,
        data,
      ];
}
