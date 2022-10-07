import "package:com_noopeshop_backend/repositories/user_repository.dart";
import "package:com_noopeshop_backend/services/users/create_user/create_user_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

// ignore: must_be_immutable
class ServiceFactory extends StatelessWidget {
  late UserRepository userRepository;

  final Widget child;

  ServiceFactory(
    this.userRepository, {
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateUserBloc>(
          create: (context) => CreateUserBloc(
            userRepository,
          ),
        ),
      ],
      child: child,
    );
  }
}
