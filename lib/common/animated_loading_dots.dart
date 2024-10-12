import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedLoadingDots extends HookWidget {
  const AnimatedLoadingDots({
    this.color,
    this.size = 8.0,
    Key? key,
  }) : super(key: key);

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..repeat();

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _dot(
            context,
            controller: controller,
            offset: 0.66,
          ),
          const SizedBox(width: 8.0),
          _dot(
            context,
            controller: controller,
            offset: 0.33,
          ),
          const SizedBox(width: 8.0),
          _dot(
            context,
            controller: controller,
            offset: 0.0,
          ),
        ],
      ),
    );
  }

  Widget _dot(
    final BuildContext context, {
    required AnimationController controller,
    required double offset,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // double opacity = (controller.value + offset) % 1;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(2 * pi * controller.value + offset),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.0),
              // color: color?.withOpacity(opacity) ??
              //     Theme.of(context).colorScheme.primary.withOpacity(opacity),
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      },
    );
  }
}
