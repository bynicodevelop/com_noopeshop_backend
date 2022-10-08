// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:equatable/equatable.dart";

part "list_common_event.dart";
part "list_common_state.dart";

class ListCommonBloc extends Bloc<ListCommonEvent, ListCommonState> {
  late CommonRepository commonRepository;

  ListCommonBloc(
    this.commonRepository,
  ) : super(const ListCommonInitialState()) {
    on<OnListCommonEvent>((event, emit) async {
      Map<String, dynamic> result = await commonRepository.list(
        event.form,
      );

      emit(ListCommonInitialState(
        list: (result["data"] as List<dynamic>)
            .map((e) => Map<String, dynamic>.from(e))
            .toList(),
      ));
    });
  }
}
