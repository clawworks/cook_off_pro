import 'package:flutter/cupertino.dart';

class WebBox extends StatelessWidget {
  const WebBox({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 300,
        maxWidth: 500,
      ),
      child: child,
    );
  }
}
