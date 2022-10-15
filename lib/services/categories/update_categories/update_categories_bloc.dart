// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/repositories/category_repository.dart";
import "package:com_noopeshop_backend/utils/logger.dart";
import "package:equatable/equatable.dart";

part "update_categories_event.dart";
part "update_categories_state.dart";

class EditCategoriesBloc
    extends Bloc<EditCategoriesEvent, EditCategoriesState> {
  final CategoryRepository categoryRepository;

  EditCategoriesBloc(
    this.categoryRepository,
  ) : super(EditCategoriesInitialState()) {
    on<OnEditCategoriesEvent>((event, emit) async {
      emit(EditCategoriesLoadingState());

      try {
        await categoryRepository.update(
          event.model,
        );

        emit(EditCategoriesSuccessState());
      } on StandardException catch (e) {
        error("$runtimeType - EditCategoriesBloc", data: {
          "message": e.message,
          "code": e.code,
        });

        emit(EditCategoriesFailureState(
          code: e.code,
        ));
      }
    });
  }
}
