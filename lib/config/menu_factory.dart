import "package:com_noopeshop_backend/config/forms/user.dart";
import "package:com_noopeshop_backend/screens/commons/list_screen.dart";
import "package:flutter/material.dart";

final menuFactory = [
  {
    "id": "users",
    "label": "Users",
    "icon": Icons.person,
    "screen": CommonListScreen(
      formData: userForm,
    ),
    "default": true,
  },
  // {
  //   "id": "products",
  //   "label": "Products",
  //   "icon": Icons.add_box_outlined,
  //   "screen": CommonListScreen(
  //     formData: userForm,
  //   )
  // }
];
