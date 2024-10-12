import 'package:cook_off_pro/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class CookOffProApp extends ConsumerWidget {
  const CookOffProApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _EagerInitialization(
      child: MaterialApp.router(
        // debugShowCheckedModeBanner: false,
        title: 'Cook Off Pro',
        routerConfig: ref.watch(pRouter),
        // themeMode: ThemeMode.dark,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orangeAccent,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orangeAccent,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        // theme: ref.watch(pLightTheme),
        // darkTheme: ref.watch(pDarkTheme),
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
    //     useMaterial3: true,
    //   ),
    //   home: const HomePage(title: 'Flutter Demo Home Page'),
    //   scaffoldMessengerKey: scaffoldMessengerKey,
    // );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(pUser);
    // ref.watch(pUserId);
    // ref.watch(pUserName);
    // ref.watch(pIsAuthorizedAdminUser);
    // ref.watch(pIsChandler);
    return child;
  }
}
