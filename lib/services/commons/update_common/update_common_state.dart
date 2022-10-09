part of "update_common_bloc.dart";

abstract class UpdateCommonState extends Equatable {
  const UpdateCommonState();

  @override
  List<Object> get props => [];
}

class UpdateCommonInitialState extends UpdateCommonState {}

class UpdateCommonLoadingState extends UpdateCommonState {}

class UpdateCommonSuccessState extends UpdateCommonState {}

class UpdateCommonFailureState extends UpdateCommonState {
  final String code;

  const UpdateCommonFailureState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
