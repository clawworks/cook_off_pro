import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../router.dart';

/// Prefer using [showTextFieldDialog] with BuildContext
/// Only use this in controllers or elsewhere where no context is available
///
/// Returns the `String?` entered into the TextField
Future<String?> showTextFieldDialogNoContext({
  required String title,
  String? message,
  Widget? body,
  bool showCancel = true,
  String? hintText,
  String? cancelText,
  String? confirmText,
  Color? confirmColor,
  bool popOnCancel = true,
  bool popOnConfirm = true,
  Color? cancelColor,
  EdgeInsets? padding,
}) async {
  BuildContext? context = rootNavigatorKey.currentContext;
  if (context != null) {
    return showTextFieldDialog(
      context: context,
      title: title,
      message: message,
      hintText: hintText,
      body: body,
      padding: padding,
      showCancel: showCancel,
      cancelText: cancelText,
      confirmText: confirmText,
      confirmColor: confirmColor,
      popOnCancel: popOnCancel,
      popOnConfirm: popOnConfirm,
      cancelColor: cancelColor,
    );
  }
  return null;
}

/// Prefer this method over [showTextFieldDialogNoContext]
/// Shows a [_TextFieldDialog] styled consistently
///
/// Returns the `String?` entered into the TextField
Future<String?> showTextFieldDialog({
  required BuildContext context,
  required String title,
  String? message,
  Widget? body,
  bool showCancel = true,
  String? hintText,
  String? cancelText,
  String? confirmText,
  Color? confirmColor,
  bool popOnCancel = true,
  bool popOnConfirm = true,
  Color? cancelColor,
  EdgeInsets? padding,
}) async {
  String? text = await showDialog(
    context: context,
    builder: (context) => _TextFieldDialog(
      title: title,
      message: message,
      hintText: hintText,
      body: body,
      padding: padding,
      showCancel: showCancel,
      cancelText: cancelText,
      confirmText: confirmText,
      confirmColor: confirmColor,
      popOnCancel: popOnCancel,
      popOnConfirm: popOnConfirm,
      cancelColor: cancelColor,
    ),
  );
  return text;
}

class _TextFieldDialog extends HookWidget {
  const _TextFieldDialog({
    required this.title,
    this.message,
    this.body,
    this.padding,
    this.showCancel = true,
    this.popOnCancel = true,
    this.popOnConfirm = true,
    this.hintText,
    this.cancelText,
    this.confirmText,
    this.confirmColor,
    this.cancelColor,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? message;
  final String? hintText;
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
    TextEditingController controller = useTextEditingController();
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
                  // style: Theme.of(context).textTheme.headlineSmall,
                  // style: const TextStyle(
                  //   fontSize: 20.0,
                  //   fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (message != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message!,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 10,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    // TODO add onChanged
                  },
                  autofocus: true,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    // border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 8.0,
                    ),
                    // suffixIcon: IconButton(
                    //   icon: Icon(
                    //     _viewPassword ? Icons.visibility : Icons.visibility_off,
                    //   ),
                    //   onPressed: () {
                    //     setState(() {
                    //       _viewPassword = !_viewPassword;
                    //     });
                    //   },
                    // ),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter a name';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              if (body != null)
                Padding(
                  padding: padding ?? const EdgeInsets.all(20.0),
                  child: body!,
                ),
              const SizedBox(height: 16.0),
              const Divider(
                height: 1.0,
                thickness: 1.0,
              ),
            ],
          ),
          _buttons(context, controller),
        ],
      ),
    );
  }

  Widget _buttons(BuildContext context, TextEditingController controller) {
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
                  if (popOnCancel) context.pop(null);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
              clipBehavior: Clip.antiAliasWithSaveLayer,
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
                if (popOnConfirm) context.pop(controller.text);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
