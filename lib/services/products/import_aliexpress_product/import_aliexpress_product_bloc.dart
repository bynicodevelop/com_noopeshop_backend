// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/repositories/product_repository.dart";
import "package:equatable/equatable.dart";

part "import_aliexpress_product_event.dart";
part "import_aliexpress_product_state.dart";

class ImportAliexpressProductBloc
    extends Bloc<ImportAliexpressProductEvent, ImportAliexpressProductState> {
  late ProductRepository productRepository;

  ImportAliexpressProductBloc(
    this.productRepository,
  ) : super(ImportAliexpressProductInitialState()) {
    on<OnImportAliexpressProductEvent>((event, emit) async {
      emit(ImportAliexpressProductLoadingState());

      try {
        await productRepository.importFromAliexpress(
          event.url,
        );

        emit(ImportAliexpressProductSuccessState());
      } catch (e) {
        emit(ImportAliexpressProductFailureState(e.toString()));
      }
    });
  }
}
