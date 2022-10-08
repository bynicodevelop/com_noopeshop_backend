import "package:com_noopeshop_backend/config/menu_factory.dart";
import "package:com_noopeshop_backend/services/menu/click_menu/click_menu_bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class MenuSidebasComponent extends StatelessWidget {
  const MenuSidebasComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClickMenuBloc, ClickMenuState>(
      builder: (context, state) {
        final Map<String, dynamic> currentMenu =
            (state as ClickMenuInitialState).menu;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: menuFactory.length,
          itemBuilder: (context, index) {
            return ListTile(
              selected: currentMenu["id"] == menuFactory[index]["id"],
              onTap: () => context.read<ClickMenuBloc>().add(
                    OnClickMenuEvent(
                      menuFactory[index],
                    ),
                  ),
              leading: Icon(
                menuFactory[index]["icon"] as IconData,
              ),
              title: Text(
                menuFactory[index]["label"] as String,
              ),
            );
          },
        );
      },
    );
  }
}
