import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_jele_apps/src/core/navigation/providers.dart';
import 'package:test_jele_apps/src/core/notification/managers/notification_manager.dart';
import 'package:test_jele_apps/src/core/notification/services/notification_remote_service.dart';
import 'package:test_jele_apps/src/core/notification/services/notification_service.dart';
import 'package:test_jele_apps/src/core/notification/state_holders/notification_state_holder.dart';

final notificationManagerProvider = Provider<NotificationManager>((ref) {
  return NotificationManager(
    ref.watch(notificationServiceProvider),
    ref.watch(notificationStateHolderProvider.notifier),
  );
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationRemoteService(ref.watch(navigationManagerProvider));
});

final notificationStateHolderProvider = StateNotifierProvider<NotificationStateHolder, String?>((ref) {
  return NotificationStateHolder();
});
