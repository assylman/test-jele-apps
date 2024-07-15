import 'package:flutter/widgets.dart';
import 'package:test_jele_apps/src/core/notification/services/notification_service.dart';
import 'package:test_jele_apps/src/core/notification/state_holders/notification_state_holder.dart';

class NotificationManager {
  const NotificationManager(
    this._messagingService,
    this._stateHolder,
  );

  final NotificationService _messagingService;
  final NotificationStateHolder _stateHolder;

  Future<void> init(BuildContext context) async {
    await _messagingService.init(context);
  }

  Future<void> getToken() async {
    final token = await _messagingService.getToken();
    if (token != null) {
      _stateHolder.setToken(token);
    }
  }

  void clearToken() => _stateHolder.clear();
}
