import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationManager {
  const NavigationManager(this._router);

  final GoRouter _router;

  void go(String route, {Object? extra}) {
    _router.go(route, extra: extra);
  }

  void showSnackBar({
    required String title,
    required String message,
  }) {
    final context = _router.configuration.navigatorKey.currentContext!;

    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 4,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        content: Column(
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge,
            ),
            if (message.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                message,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
