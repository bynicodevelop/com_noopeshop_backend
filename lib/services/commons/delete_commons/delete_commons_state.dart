part of "delete_commons_bloc.dart";

abstract class DeleteCommonState extends Equatable {
  const DeleteCommonState();

  @override
  List<Object> get props => [];
}

class DeleteCommonInitialState extends DeleteCommonState {}

class DeleteCommonLoadingState extends DeleteCommonState {}

class DeleteCommonSuccessState extends DeleteCommonState {}

class DeleteCommonErrorState extends DeleteCommonState {
  final String code;

  const DeleteCommonErrorState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
