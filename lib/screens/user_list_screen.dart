import "package:com_noopeshop_backend/services/users/list_user/list_user_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add User"),
            ),
          ],
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
