import "package:com_noopeshop_backend/components/forms/inputs/upload/upload_input_form_component.dart";
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
        children: const [
          SizedBox(
            height: double.infinity,
            width: 300,
            child: MenuSidebasComponent(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: UploadInputFormComponent(),
            ),
          ),
        ],
      ),
    );
  }
}
