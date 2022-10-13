// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";

part "list_products_event.dart";
part "list_products_state.dart";

class ListProductsBloc extends Bloc<ListProductsEvent, ListProductsState> {
  ListProductsBloc() : super(ListProductsInitialState()) {
    on<OnListProductsEvent>((event, emit) {});
  }
}
