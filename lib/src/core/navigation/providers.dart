import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_jele_apps/src/core/navigation/go_router.dart';
import 'package:test_jele_apps/src/core/navigation/navigation_manager.dart';

final navigationManagerProvider = Provider<NavigationManager>((ref) {
  final goRouter = ref.watch(routerProvider);
  return NavigationManager(goRouter);
});
