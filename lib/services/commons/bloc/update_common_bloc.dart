// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:equatable/equatable.dart";

part "update_common_event.dart";
part "update_common_state.dart";

class UpdateCommonBloc extends Bloc<UpdateCommonEvent, UpdateCommonState> {
  late CommonRepository commonRepository;

  UpdateCommonBloc(
    this.commonRepository,
  ) : super(UpdateCommonInitialState()) {
    on<OnUpdateCommonEvent>((event, emit) async {
      emit(UpdateCommonLoadingState());

      try {
        await commonRepository.update(event.data);

        emit(UpdateCommonSuccessState());
      } on StandardException catch (e) {
        emit(UpdateCommonErrorState(
          code: e.code,
        ));
      }
    });
  }
}
