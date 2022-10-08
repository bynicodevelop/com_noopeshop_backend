part of "create_common_bloc.dart";

abstract class CreateCommonState extends Equatable {
  const CreateCommonState();

  @override
  List<Object> get props => [];
}

class CreateCommonInitialState extends CreateCommonState {}

class CreateCommonLoadingState extends CreateCommonState {}

class CreateCommonSuccessState extends CreateCommonState {}

class CreateCommonFailureState extends CreateCommonState {
  final String code;

  const CreateCommonFailureState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
