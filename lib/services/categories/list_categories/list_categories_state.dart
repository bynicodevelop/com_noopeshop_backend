part of "list_categories_bloc.dart";

abstract class ListCategoriesState extends Equatable {
  const ListCategoriesState();

  @override
  List<Object> get props => [];
}

class ListCategoriesInitialState extends ListCategoriesState {}

class ListCategoriesLoadingState extends ListCategoriesState {}

class ListCategoriesLoadedState extends ListCategoriesState {
  final List<CategoryModel> categories;

  const ListCategoriesLoadedState({
    required this.categories,
  });

  @override
  List<Object> get props => [
        categories,
      ];
}

class ListCategoriesFailureState extends ListCategoriesState {
  final String code;

  const ListCategoriesFailureState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
