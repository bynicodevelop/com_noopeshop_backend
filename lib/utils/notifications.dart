import "package:another_flushbar/flushbar.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:flutter/material.dart";

Future<void> notification(
  BuildContext context,
  String? title,
  String message,
  Color color, {
  textColor = Colors.white,
}) async =>
    Flushbar(
      title: title,
      titleColor: textColor,
      message: message,
      messageColor: textColor,
      backgroundColor: color,
      duration: const Duration(
        seconds: 2,
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      margin: const EdgeInsets.all(
        kDefaultPadding,
      ),
      borderRadius: BorderRadius.circular(
        kDefaultPadding,
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      maxWidth: MediaQuery.of(
            context,
          ).size.width /
          3,
    ).show(context);

Future<void> sendNotification(
  BuildContext context,
  String message,
) async =>
    notification(
      context,
      null,
      message,
      Colors.white,
      textColor: Colors.black,
    );
