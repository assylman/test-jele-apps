import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_jele_apps/src/features/loading/loading_page.dart';
import 'package:test_jele_apps/src/features/main/main_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LoadingPage(),
        ),
        GoRoute(
          path: '/main',
          builder: (context, state) => const MainPage(),
        ),
      ],
    );
  },
);
