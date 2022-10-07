import "package:another_flushbar/flushbar.dart";
import "package:com_noopeshop_backend/config/constants.dart";
import "package:flutter/material.dart";

void notification(
  BuildContext context,
  String? title,
  String message,
  Color color, {
  textColor = Colors.white,
}) =>
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

void sendNotification(
  BuildContext context,
  String message,
) =>
    notification(
      context,
      null,
      message,
      Colors.white,
      textColor: Colors.black,
    );

void sendErrorNotification(
  BuildContext context,
  String message, {
  String title = "Error",
}) =>
    notification(
      context,
      title,
      message,
      Colors.red,
    );

void sendSuccessNotification(
  BuildContext context,
  String message, {
  String title = "Success",
}) =>
    notification(
      context,
      title,
      message,
      Colors.green,
    );
