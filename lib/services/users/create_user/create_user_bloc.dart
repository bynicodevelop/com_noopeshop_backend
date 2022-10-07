// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/repositories/user_repository.dart";
import "package:equatable/equatable.dart";

part "create_user_event.dart";
part "create_user_state.dart";

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  late UserRepository userRepository;

  CreateUserBloc(this.userRepository) : super(CreateUserInitialState()) {
    on<OnCreateUserEvent>((event, emit) async {
      emit(CreateUserLoadingState());

      try {
        await userRepository.create(
          event.data,
        );

        emit(CreateUserSuccessState());
      } catch (e) {
        emit(CreateUserErrorState(
          code: e.toString(),
        ));
      }
    });
  }
}
