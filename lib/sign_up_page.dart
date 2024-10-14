import 'package:cook_off_pro/common/web_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: WebBox(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: useTextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Sign Up!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
