import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    required this.text,
    this.shrinkWrap = false,
    this.elevation = 3.0,
    this.leftPadding = 20.0,
    this.topPadding = 20.0,
    this.rightPadding = 20.0,
    this.bottomPadding = 20.0,
    this.horizontalMargin = 8.0,
    this.verticalMargin = 8.0,
    super.key,
  });

  final String text;
  final bool shrinkWrap;
  final double elevation;
  final double leftPadding;
  final double topPadding;
  final double rightPadding;
  final double bottomPadding;
  final double horizontalMargin;
  final double verticalMargin;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      child: InkWell(
        child: Row(
          mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                leftPadding,
                topPadding,
                rightPadding,
                bottomPadding,
              ),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
