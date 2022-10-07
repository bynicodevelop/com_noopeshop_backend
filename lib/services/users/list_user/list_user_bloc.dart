// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/repositories/user_repository.dart";
import "package:equatable/equatable.dart";

part "list_user_event.dart";
part "list_user_state.dart";

class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {
  late UserRepository userRepository;

  ListUserBloc(
    this.userRepository,
  ) : super(const ListUserInitialState()) {
    on<OnListUserEvent>((event, emit) async {
      try {
        final List<Map<String, dynamic>> users = await userRepository.list();
        emit(ListUserInitialState(
          users: users,
        ));
      } catch (e) {
        emit(ListUserFailureState(
          code: e.toString(),
        ));
      }
    });
  }
}
