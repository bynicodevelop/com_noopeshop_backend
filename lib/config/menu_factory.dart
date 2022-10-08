import "package:com_noopeshop_backend/screens/product_list_screen.dart";
import "package:com_noopeshop_backend/screens/user_list_screen.dart";
import "package:flutter/material.dart";

const menuFactory = [
  {
    "id": "users",
    "label": "Users",
    "icon": Icons.person,
    "screen": UserListScreen(),
    "default": true,
  },
  {
    "id": "products",
    "label": "Products",
    "icon": Icons.add_box_outlined,
    "screen": ProductListScreen()
  }
];
