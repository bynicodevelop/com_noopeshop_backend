// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:equatable/equatable.dart";

part "create_common_event.dart";
part "create_common_state.dart";

class CreateCommonBloc extends Bloc<CreateCommonEvent, CreateCommonState> {
  late CommonRepository commonRepository;

  CreateCommonBloc(
    this.commonRepository,
  ) : super(CreateCommonInitialState()) {
    on<OnCreateCommonEvent>((event, emit) async {
      emit(CreateCommonLoadingState());

      try {
        await commonRepository.create(
          event.data,
        );

        emit(CreateCommonSuccessState());
      } on StandardException catch (e) {
        emit(CreateCommonFailureState(
          code: e.code,
        ));
      }
    });
  }
}
