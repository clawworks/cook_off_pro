import 'package:cook_off_pro/auth_repository.dart';
import 'package:cook_off_pro/go_router_refresh_stream.dart';
import 'package:cook_off_pro/home_page.dart';
import 'package:cook_off_pro/oops_page.dart';
import 'package:cook_off_pro/settings_page.dart';
import 'package:cook_off_pro/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppRoute {
  home,
  signUp,
  settings,
  settingsRecoil,
  history,
  upload,
  manage,
  userName,
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

final pRouter = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(pAuthRepository);

  return GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(authRepository.userChanges()),
    redirect: (context, state) {
      print("In Redirect check; User: ${authRepository.currentUser}");
      // if (authRepository.currentUser == null) {
      //   return '/${AppRoute.userName.name}';
      // }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) {
          return const HomePage(
            title: 'Cook Off Pro',
          );
        },
        routes: [
          GoRoute(
            path: 'signUp',
            name: AppRoute.signUp.name,
            builder: (context, state) {
              return const SignUpPage();
            },
          ),
          GoRoute(
            path: 'settings',
            name: AppRoute.settings.name,
            builder: (context, state) {
              return const SettingsPage();
            },
            routes: [
              // GoRoute(
              //   path: 'upload',
              //   name: AppRoute.upload.name,
              //   builder: (context, state) {
              //     return const UploadPage();
              //   },
              // ),
              // GoRoute(
              //   path: 'manage',
              //   name: AppRoute.manage.name,
              //   builder: (context, state) {
              //     return const ManagePage();
              //   },
              // ),
              // GoRoute(
              //   path: 'history/:filter',
              //   name: AppRoute.history.name,
              //   builder: (context, state) {
              //     bool filter =
              //         bool.parse(state.pathParameters['filter'] ?? 'true');
              //     return HistoryPage(filter: filter);
              //   },
              // ),
              // GoRoute(
              //   path: 'recoil',
              //   name: AppRoute.settingsRecoil.name,
              //   builder: (context, state) {
              //     return const RecoilSettingsPage(fromSettings: true);
              //   },
              //   routes: [
              //     GoRoute(
              //       path: 'messages/:type',
              //       name: AppRoute.settingsRecoilMessages.name,
              //       builder: (context, state) {
              //         String typeString =
              //             state.pathParameters['type'] ?? 'monthly';
              //         RecoilSubscriptionType type =
              //             RecoilSubscriptionType.fromJson(typeString);
              //         return RecoilMessagesPage(type: type);
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
          // GoRoute(
          //   path: 'recoil',
          //   name: AppRoute.recoil.name,
          //   builder: (context, state) {
          //     return const RecoilPage();
          //   },
          //   routes: [
          //     GoRoute(
          //       path: 'settings',
          //       name: AppRoute.recoilSettings.name,
          //       builder: (context, state) {
          //         return const RecoilSettingsPage(fromSettings: false);
          //       },
          //       routes: [
          //         // GoRoute(
          //         //   path: 'messages/:type',
          //         //   name: AppRoute.recoilMessages.name,
          //         //   builder: (context, state) {
          //         //     String typeString =
          //         //         state.pathParameters['type'] ?? 'monthly';
          //         //     RecoilSubscriptionType type =
          //         //         RecoilSubscriptionType.fromJson(typeString);
          //         //     return RecoilMessagesPage(type: type);
          //         //   },
          //         // ),
          //         // GoRoute(
          //         //   path: 'myHistory',
          //         //   name: AppRoute.myHistory.name,
          //         //   builder: (context, state) {
          //         //     return const HistoryPage(filter: true);
          //         //   },
          //         // ),
          //       ],
          //     ),
          //   ],
          // ),

          //   GoRoute(
          //     path: 'joinGame',
          //     name: AppRoute.joinGame.name,
          //     builder: (context, state) {
          //       return const JoinGamePage();
          //     },
          //   ),
          //   GoRoute(
          //     path: 'rules',
          //     name: AppRoute.rules.name,
          //     pageBuilder: (context, state) {
          //       return CustomTransitionPage(
          //         fullscreenDialog: true,
          //         child: RulesPage(),
          //         transitionsBuilder: _slideUpTransition,
          //       );
          //     },
          //   ),
          //   GoRoute(
          //     path: 'game/:gameId',
          //     name: AppRoute.game.name,
          //     builder: (context, state) {
          //       return LoadGamePage(gameId: state.pathParameters['gameId']);
          //     },
          //     routes: [
          //       GoRoute(
          //         path: 'share',
          //         builder: (context, state) {
          //           return ShareGamePage(gameId: state.pathParameters['gameId']);
          //         },
          //       ),
          //       GoRoute(
          //         path: 'changeName',
          //         builder: (context, state) {
          //           return ChangeNamePage(
          //             gameId: state.pathParameters['gameId'],
          //             updateUserName: (name) async {
          //               await ref.read(pAuthService.notifier).updateName(name);
          //             },
          //           );
          //         },
          //       ),
          //       GoRoute(
          //         path: 'rules',
          //         pageBuilder: (context, state) {
          //           return CustomTransitionPage(
          //             fullscreenDialog: true,
          //             child: RulesPage(),
          //             transitionsBuilder: _slideUpTransition,
          //           );
          //         },
          //       ),
          //     ],
          //   ),
        ],
      ),
      // GoRoute(
      //   path: '/userName',
      //   name: AppRoute.userName.name,
      //   builder: (context, state) {
      //     return const UserNamePage();
      //   },
      // ),
    ],
    errorBuilder: (context, state) {
      String currentPath = state.uri.path;
      print("Error Navigating to path: $currentPath");
      return const OopsPage(
        message: "We can't find the page you're looking for...",
      );
    },
  );
});

SlideTransition _slideUpTransition(
    context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.ease;
  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}

FadeTransition _fadeTransition(context, animation, secondaryAnimation, child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
