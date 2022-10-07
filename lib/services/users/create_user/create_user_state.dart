part of "create_user_bloc.dart";

abstract class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object> get props => [];
}

class CreateUserInitialState extends CreateUserState {}

class CreateUserLoadingState extends CreateUserState {}

class CreateUserSuccessState extends CreateUserState {}

class CreateUserErrorState extends CreateUserState {
  final String code;

  const CreateUserErrorState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
