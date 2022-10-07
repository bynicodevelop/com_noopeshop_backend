import "package:flutter/material.dart";

class UserListScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const UserListScreen({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () =>
                    widget.scaffoldKey.currentState!.openEndDrawer(),
                child: const Text("Add User"),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: const [],
          )
        ],
      ),
    );
  }
}
