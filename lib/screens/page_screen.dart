import "package:com_noopeshop_backend/config/menu_factory.dart";
import "package:com_noopeshop_backend/services/menu/click_menu/click_menu_bloc.dart";
import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";

class PageScreen extends StatefulWidget {
  const PageScreen({super.key});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();

    for (Map<String, dynamic> menu in menuFactory) {
      _screens.add(
        menu["screen"] as Widget,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClickMenuBloc, ClickMenuState>(
      listener: (context, state) async {
        if (state is ClickMenuInitialState) {
          _pageController.jumpToPage(
            menuFactory.indexOf(state.menu as Map<String, Object>),
          );
        }
      },
      child: PageView(
        controller: _pageController,
        children: _screens,
      ),
    );
  }
}
