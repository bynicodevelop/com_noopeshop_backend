part of "delete_commons_bloc.dart";

abstract class DeleteCommonsState extends Equatable {
  const DeleteCommonsState();

  @override
  List<Object> get props => [];
}

class DeleteCommonsInitialState extends DeleteCommonsState {}

class DeleteCommonsLoadingState extends DeleteCommonsState {}

class DeleteCommonsSuccessState extends DeleteCommonsState {}

class DeleteCommonsErrorState extends DeleteCommonsState {
  final String code;

  const DeleteCommonsErrorState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
