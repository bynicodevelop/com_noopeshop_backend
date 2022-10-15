part of "update_categories_bloc.dart";

abstract class EditCategoriesState extends Equatable {
  const EditCategoriesState();

  @override
  List<Object> get props => [];
}

class EditCategoriesInitialState extends EditCategoriesState {}

class EditCategoriesLoadingState extends EditCategoriesState {}

class EditCategoriesSuccessState extends EditCategoriesState {}

class EditCategoriesFailureState extends EditCategoriesState {
  final String code;

  const EditCategoriesFailureState({
    required this.code,
  });

  @override
  List<Object> get props => [code];
}
