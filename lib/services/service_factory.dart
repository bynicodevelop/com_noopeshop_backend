import "package:com_noopeshop_backend/config/menu_factory.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:com_noopeshop_backend/repositories/upload_repository.dart";
import "package:com_noopeshop_backend/services/commons/navigation_common/navigation_common_bloc.dart";
import "package:com_noopeshop_backend/services/menu/click_menu/click_menu_bloc.dart";
import "package:com_noopeshop_backend/utils/pretreatment.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

// ignore: must_be_immutable
class ServiceFactory extends StatelessWidget {
  late CommonRepository commonRepository;
  late UploadRepository uploadRepository;
  late PreTreatment preTreatment;

  final Widget child;

  ServiceFactory(
    this.commonRepository,
    this.uploadRepository,
    this.preTreatment, {
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> defaultMenu = menuFactory.isEmpty
        ? {}
        : menuFactory.firstWhere(
            (element) => element["default"] == true,
          );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ClickMenuBloc>(
          create: (context) => ClickMenuBloc(defaultMenu),
        ),
        BlocProvider<NavigationCommonBloc>(
          create: (context) => NavigationCommonBloc(),
        ),
      ],
      child: child,
    );
  }
}
