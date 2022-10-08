import "package:com_noopeshop_backend/components/forms/generator_form_component.dart";
import "package:com_noopeshop_backend/components/forms/wrapper_form_component.dart";
import "package:com_noopeshop_backend/components/sidebar/menu_sidebar_component.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/config/forms/user.dart";
import "package:com_noopeshop_backend/screens/user_list_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_speed_dial/flutter_speed_dial.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _formVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: double.infinity,
            width: 300,
            child: MenuSidebasComponent(),
          ),
          Expanded(
            child: Stack(
              children: [
                const UserListScreen(),
                Visibility(
                  visible: _formVisible,
                  child: Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: WrapperFormComponent(
                      onClose: () {
                        setState(() => _formVisible = false);
                      },
                      child: FormGeneratorComponent(
                        formData: userForm,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        spacing: kDefaultPadding,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.person_add,
            ),
            label: "Create user",
            onTap: () {
              setState(() => _formVisible = true);
            },
          ),
        ],
      ),
    );
  }
}
