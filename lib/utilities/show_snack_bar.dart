import 'package:cook_off_pro/cook_off_pro_app.dart';
import 'package:flutter/material.dart';

showSnackBar(
  String message, {
  BuildContext? context,
  Widget? content,
  Function? onTap,
  int durationMilliseconds = 3000,
  bool showCloseIcon = false,
}) {
  assert(content != null || message.isNotEmpty);
  if (scaffoldMessengerKey.currentState != null) {
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: durationMilliseconds),
        showCloseIcon: showCloseIcon,
        closeIconColor: context != null
            ? Theme.of(context).colorScheme.onBackground
            : Colors.black,
        padding: EdgeInsets.zero,
        content: InkWell(
          radius: 10.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: content ?? Text(message),
          ),
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

hideSnackBar() {
  if (scaffoldMessengerKey.currentState != null) {
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }
}
