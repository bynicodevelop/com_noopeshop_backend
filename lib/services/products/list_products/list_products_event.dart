part of "list_products_bloc.dart";

abstract class ListProductsEvent extends Equatable {
  const ListProductsEvent();

  @override
  List<Object> get props => [];
}

class OnListProductsEvent extends ListProductsEvent {}
