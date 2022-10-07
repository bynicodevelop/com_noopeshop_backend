part of "list_user_bloc.dart";

abstract class ListUserState extends Equatable {
  const ListUserState();

  @override
  List<Object> get props => [];
}

class ListUserInitialState extends ListUserState {
  final List<Map<String, dynamic>> users;

  const ListUserInitialState({
    this.users = const [],
  });

  @override
  List<Object> get props => [
        users,
      ];
}

class ListUserFailureState extends ListUserState {
  final String code;

  const ListUserFailureState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
