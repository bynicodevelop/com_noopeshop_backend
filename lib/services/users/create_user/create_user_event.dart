part of "create_user_bloc.dart";

abstract class CreateUserEvent extends Equatable {
  const CreateUserEvent();

  @override
  List<Object> get props => [];
}

class OnCreateUserEvent extends CreateUserEvent {
  final Map<String, dynamic> data;

  const OnCreateUserEvent({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}
