import 'package:flutter/rendering.dart';

// TODO is this used? Maybe we don't need it...

class WebConstraints extends BoxConstraints {
  WebConstraints() {
    const BoxConstraints(
      minWidth: 300,
      maxWidth: 600,
    );
  }

  @override
  bool get isNormalized => true;

  @override
  bool get isTight => false;
}
