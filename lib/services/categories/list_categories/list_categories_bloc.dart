import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/models/category_model.dart";
import "package:com_noopeshop_backend/repositories/category_repository.dart";
import "package:equatable/equatable.dart";

part "list_categories_event.dart";
part "list_categories_state.dart";

class ListCategoriesBloc
    extends Bloc<ListCategoriesEvent, ListCategoriesState> {
  final CategoryRepository categoryRepository;

  ListCategoriesBloc(
    this.categoryRepository,
  ) : super(ListCategoriesInitialState()) {
    on<OnListCategoriesEvent>((event, emit) async {
      emit(ListCategoriesLoadingState());

      try {
        final List<CategoryModel> categories = await categoryRepository.list();

        emit(ListCategoriesLoadedState(
          categories: categories,
        ));
      } on StandardException catch (e) {
        emit(ListCategoriesFailureState(
          code: e.code,
        ));
      }
    });
  }
}
