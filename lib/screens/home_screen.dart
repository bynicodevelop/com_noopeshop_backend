import "package:com_noopeshop_backend/components/sidebar/menu_sidebar_component.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SizedBox(
            height: double.infinity,
            width: 300,
            child: MenuSidebasComponent(),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
