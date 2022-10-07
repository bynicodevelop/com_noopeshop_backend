import "package:com_noopeshop_backend/components/forms/generator_form_component.dart";
import "package:com_noopeshop_backend/components/sidebar/menu_sidebar_component.dart";
import "package:com_noopeshop_backend/screens/user_list_screen.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const Drawer(
        child: FormGeneratorComponent(),
      ),
      body: Row(
        children: [
          const SizedBox(
            height: double.infinity,
            width: 300,
            child: MenuSidebasComponent(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserListScreen(
                scaffoldKey: _scaffoldKey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
