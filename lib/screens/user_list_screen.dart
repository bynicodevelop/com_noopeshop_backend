import "package:com_noopeshop_backend/config/constants.dart";
import "package:com_noopeshop_backend/services/users/list_user/list_user_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class UserListScreen extends StatefulWidget {
  final String title;

  const UserListScreen({
    super.key,
    this.title = "User List",
  });

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: kDefaultPadding,
            left: kDefaultPadding,
            bottom: kDefaultPadding,
          ),
          child: Row(
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        BlocBuilder<ListUserBloc, ListUserState>(
          bloc: context.read<ListUserBloc>()..add(OnListUserEvent()),
          builder: (context, state) {
            final List<Map<String, dynamic>> users =
                (state as ListUserInitialState).users;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> user = users[index];
                return ListTile(
                  onTap: () {},
                  title: Text(user["displayName"]),
                  subtitle: Text(user["email"]),
                );
              },
            );
          },
        )
      ],
    );
  }
}
