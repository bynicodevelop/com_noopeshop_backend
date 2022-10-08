import "package:com_noopeshop_backend/config/menu_factory.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:com_noopeshop_backend/repositories/user_repository.dart";
import "package:com_noopeshop_backend/services/commons/create_common/create_common_bloc.dart";
import "package:com_noopeshop_backend/services/commons/delete_common/delete_commons_bloc.dart";
import "package:com_noopeshop_backend/services/commons/list_common/list_common_bloc.dart";
import "package:com_noopeshop_backend/services/menu/click_menu/click_menu_bloc.dart";
import "package:com_noopeshop_backend/services/users/create_user/create_user_bloc.dart";
import "package:com_noopeshop_backend/services/users/list_user/list_user_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

// ignore: must_be_immutable
class ServiceFactory extends StatelessWidget {
  late CommonRepository commonRepository;
  late UserRepository userRepository;

  final Widget child;

  ServiceFactory(
    this.commonRepository,
    this.userRepository, {
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClickMenuBloc>(
          create: (context) => ClickMenuBloc(
            menuFactory.firstWhere(
              (element) => element["default"] == true,
            ),
          ),
        ),
        BlocProvider<CreateUserBloc>(
          create: (context) => CreateUserBloc(
            userRepository,
          ),
        ),
        BlocProvider<ListUserBloc>(
          create: (context) => ListUserBloc(
            userRepository,
          ),
        ),
        BlocProvider<DeleteCommonBloc>(
          create: (context) => DeleteCommonBloc(
            commonRepository,
          ),
        ),
        BlocProvider<ListCommonBloc>(
          create: (context) => ListCommonBloc(
            commonRepository,
          ),
        ),
        BlocProvider<CreateCommonBloc>(
          create: (context) => CreateCommonBloc(
            commonRepository,
          ),
        ),
      ],
      child: child,
    );
  }
}
