// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/repositories/product_repository.dart";
import "package:equatable/equatable.dart";

part "list_products_event.dart";
part "list_products_state.dart";

class ListProductsBloc extends Bloc<ListProductsEvent, ListProductsState> {
  final ProductRepository productRepository;

  ListProductsBloc(
    this.productRepository,
  ) : super(ListProductsInitialState()) {
    on<OnListProductsEvent>((event, emit) {
      print("OnListProductsEvent");
    });
  }
}
