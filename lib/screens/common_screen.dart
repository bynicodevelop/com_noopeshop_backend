import "package:com_noopeshop_backend/screens/commons/create_screen.dart";
import "package:com_noopeshop_backend/screens/commons/details_screen.dart";
import "package:com_noopeshop_backend/screens/commons/edit_screen.dart";
import "package:com_noopeshop_backend/screens/commons/list_screen.dart";
import "package:com_noopeshop_backend/services/commons/navigation_common/navigation_common_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class CommonScreen extends StatefulWidget {
  final Map<String, dynamic> form;

  const CommonScreen({
    super.key,
    required this.form,
  });

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    if (widget.form.isEmpty) {
      return const Center(
        child: Text("Configuration form not found"),
      );
    }

    return BlocListener<NavigationCommonBloc, NavigationCommonState>(
      listener: (context, state) {
        _pageController.jumpToPage(
          (state as NavigationCommonInitialState).index,
        );
      },
      child: PageView(
        controller: _pageController,
        children: [
          CommonListScreen(
            form: widget.form,
          ),
          CommonDetailsScreen(
            form: widget.form,
          ),
          CommonEditScreen(
            form: widget.form,
          ),
          CommonCreateScreen(
            form: widget.form,
          )
        ],
      ),
    );
  }
}
