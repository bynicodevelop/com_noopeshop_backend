import "package:com_noopeshop_backend/components/sidebar/menu_sidebar_component.dart";
import "package:com_noopeshop_backend/screens/page_screen.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: double.infinity,
            width: 300,
            child: MenuSidebasComponent(),
          ),
          Expanded(
            child: PageScreen(),
          ),
        ],
      ),
    );
  }
}
