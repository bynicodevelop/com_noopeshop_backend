part of "list_products_bloc.dart";

abstract class ListProductsState extends Equatable {
  const ListProductsState();

  @override
  List<Object> get props => [];
}

class ListProductsInitialState extends ListProductsState {}

class ListProductsLoadingState extends ListProductsState {}

class ListProductsSuccessState extends ListProductsState {
  final List<ProductModel> products;

  const ListProductsSuccessState({
    required this.products,
  });

  @override
  List<Object> get props => [
        products,
      ];
}

class ListProductsFailureState extends ListProductsState {
  final String code;

  const ListProductsFailureState({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
