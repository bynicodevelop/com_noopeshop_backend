part of "list_user_bloc.dart";

abstract class ListUserEvent extends Equatable {
  const ListUserEvent();

  @override
  List<Object> get props => [];
}

class OnListUserEvent extends ListUserEvent {}
