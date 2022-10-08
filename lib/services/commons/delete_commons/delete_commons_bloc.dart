import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:equatable/equatable.dart";

part "delete_commons_event.dart";
part "delete_commons_state.dart";

class DeleteCommonBloc extends Bloc<DeleteCommonsEvent, DeleteCommonsState> {
  final CommonRepository commonRepository;

  DeleteCommonBloc(
    this.commonRepository,
  ) : super(DeleteCommonsInitialState()) {
    on<OnDeleteCommonsEvent>((event, emit) async {
      emit(DeleteCommonsLoadingState());

      try {
        await commonRepository.delete({
          "collection": event.form["collection"],
          "uid": event.formData["uid"],
        });
      } on StandardException catch (e) {
        emit(DeleteCommonsErrorState(
          code: e.code,
        ));
      }
    });
  }
}
