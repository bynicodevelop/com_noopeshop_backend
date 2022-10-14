// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/repositories/category_repository.dart";
import "package:equatable/equatable.dart";

part "create_category_event.dart";
part "create_category_state.dart";

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  late CategoryRepository categoryRepository;

  CreateCategoryBloc(
    this.categoryRepository,
  ) : super(CreateCategoryInitialState()) {
    on<OnCreateCategoryEvent>((event, emit) async {
      emit(CreateCategoryLoadingState());

      try {
        await categoryRepository.create(
          event.data,
        );

        emit(CreateCategorySuccessState());
      } on StandardException catch (e) {
        emit(CreateCategoryErrorState(
          code: e.code,
        ));
      }
    });
  }
}
