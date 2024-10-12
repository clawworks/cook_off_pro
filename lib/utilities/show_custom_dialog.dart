import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router.dart';

/// Prefer using [showCustomDialog] with BuildContext
/// Only use this in controllers or elsewhere where no context is available
///
Future<bool?> showCustomDialogNoContext({
  required String title,
  String? message,
  Widget? body,
  bool showCancel = true,
  String? cancelText,
  String? confirmText,
  Color? confirmColor,
  Color? cancelColor,
  EdgeInsets? padding,
}) async {
  BuildContext? context = rootNavigatorKey.currentContext;
  if (context != null) {
    return showCustomDialog(
      context: context,
      title: title,
      message: message,
      body: body,
      padding: padding,
      showCancel: showCancel,
      cancelText: cancelText,
      confirmText: confirmText,
      confirmColor: confirmColor,
      cancelColor: cancelColor,
    );
  }
  return null;
}

/// Prefer this method over [showCustomDialogNoContext]
/// Shows a [_CustomDialog] styled consistently
///
/// Returns a `bool` of Confirm == true or not
Future<bool?> showCustomDialog({
  required BuildContext context,
  required String title,
  String? message,
  Widget? body,
  bool showCancel = true,
  String? cancelText,
  String? confirmText,
  Color? confirmColor,
  Color? cancelColor,
  EdgeInsets? padding,
}) async {
  bool? confirmed = await showDialog(
    context: context,
    builder: (context) => _CustomDialog(
      title: title,
      message: message,
      body: body,
      padding: padding,
      showCancel: showCancel,
      cancelText: cancelText,
      confirmText: confirmText,
      confirmColor: confirmColor,
      cancelColor: cancelColor,
    ),
  );
  return confirmed;
}

class _CustomDialog extends StatelessWidget {
  const _CustomDialog({
    required this.title,
    this.message,
    this.body,
    this.padding,
    this.showCancel = true,
    this.popOnCancel = true,
    this.popOnConfirm = true,
    this.cancelText,
    this.confirmText,
    this.confirmColor,
    this.cancelColor,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? message;
  final Widget? body;
  final EdgeInsets? padding;
  final bool showCancel;
  final bool popOnCancel;
  final bool popOnConfirm;
  final String? cancelText;
  final String? confirmText;
  final Color? confirmColor;
  final Color? cancelColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (message != null)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    message!,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 10,
                  ),
                ),
              if (body != null)
                Padding(
                  padding: padding ?? const EdgeInsets.all(20.0),
                  child: body!,
                ),
              const Divider(
                height: 1.0,
                thickness: 1.0,
              ),
            ],
          ),
          _buttons(context),
        ],
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          if (showCancel)
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (popOnCancel) context.pop(false);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cancelText ?? 'Cancel',
                    style: TextStyle(
                      color: cancelColor,
                    ),
                  ),
                ),
              ),
            ),
          if (showCancel)
            const VerticalDivider(
              width: 1.0,
              thickness: 1.0,
            ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: const Radius.circular(10.0),
                    bottomLeft: Radius.circular(showCancel ? 0.0 : 10.0),
                  ),
                ),
              ),
              onPressed: () {
                if (popOnConfirm) context.pop(true);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  confirmText ?? 'Confirm',
                  style: TextStyle(
                    color: confirmColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
