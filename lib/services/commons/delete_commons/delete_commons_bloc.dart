import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:equatable/equatable.dart";

part "delete_commons_event.dart";
part "delete_commons_state.dart";

class DeleteCommonBloc extends Bloc<DeleteCommonEvent, DeleteCommonState> {
  final CommonRepository commonRepository;

  DeleteCommonBloc(
    this.commonRepository,
  ) : super(DeleteCommonInitialState()) {
    on<OnDeleteCommonEvent>((event, emit) async {
      emit(DeleteCommonLoadingState());

      try {
        await commonRepository.delete({
          "collection": event.form["collection"],
          "uid": event.formData["uid"],
        });

        emit(DeleteCommonSuccessState());
      } on StandardException catch (e) {
        emit(DeleteCommonErrorState(
          code: e.code,
        ));
      }
    });
  }
}
