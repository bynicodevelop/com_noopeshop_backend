// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/utils/logger.dart";
import "package:equatable/equatable.dart";

part "wrapper_page_event.dart";
part "wrapper_page_state.dart";

const Map<String, dynamic> pages = {
  "list": 0,
  "create": 1,
  "edit": 2,
};

class WrapperPageBloc extends Bloc<WrapperPageEvent, WrapperPageState> {
  WrapperPageBloc() : super(const WrapperPageInitialState()) {
    on<OnWrapperPageEvent>((event, emit) {
      info(
        "OnWrapperPageEvent",
      );

      emit(WrapperPageInitialState(
        model: event.model,
        index: pages[event.name],
      ));
    });
  }
}
