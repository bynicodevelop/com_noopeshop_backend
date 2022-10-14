part of "create_category_bloc.dart";

abstract class CreateCategoryState extends Equatable {
  const CreateCategoryState();

  @override
  List<Object> get props => [];
}

class CreateCategoryInitialState extends CreateCategoryState {}

class CreateCategoryLoadingState extends CreateCategoryState {}

class CreateCategorySuccessState extends CreateCategoryState {}

class CreateCategoryErrorState extends CreateCategoryState {
  final String code;

  const CreateCategoryErrorState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
