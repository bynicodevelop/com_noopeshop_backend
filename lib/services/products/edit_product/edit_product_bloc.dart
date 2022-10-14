// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/models/product_model.dart";
import "package:com_noopeshop_backend/repositories/product_repository.dart";
import "package:equatable/equatable.dart";

part "edit_product_event.dart";
part "edit_product_state.dart";

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  late ProductRepository productRepository;

  EditProductBloc(
    this.productRepository,
  ) : super(EditProductInitialState()) {
    on<OnEditProductEvent>((event, emit) async {
      emit(EditProductLoadingState());

      try {
        await productRepository.update(
          event.productModel.toJson(),
        );

        emit(EditProductSuccessState());
      } on StandardException catch (e) {
        emit(EditProductFailureState(
          code: e.code,
        ));
      }
    });
  }
}
