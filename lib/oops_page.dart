import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OopsPage extends StatelessWidget {
  const OopsPage({this.message, Key? key}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Oops!',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 20.0),
              Text(
                message ?? 'We had a problem. Please go back and try again.',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/');
                  }
                },
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
