import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:test_jele_apps/src/core/firebase/firebase_instance.dart';
import 'package:test_jele_apps/src/core/firebase/options/firebase_options.dart';
import 'package:test_jele_apps/src/core/navigation/navigation_manager.dart';
import 'package:test_jele_apps/src/core/notification/services/notification_service.dart';

class NotificationRemoteService implements NotificationService {
  const NotificationRemoteService(
    this._navigationManager,
  );

  final NavigationManager _navigationManager;

  @override
  Future<void> init(BuildContext context) async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    FirebaseMessaging.onMessage.listen((message) {
      _onMessage(context, message);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void _onMessage(BuildContext context, RemoteMessage message) {
    if (message.notification != null) {
      final msg = message.notification!;
      if (msg.title != null) {
        _navigationManager.showSnackBar(
          title: msg.title!,
          message: msg.body ?? '',
        );
      }
    }
  }

  @override
  Future<String?> getToken() async => await FirebaseMessaging.instance.getToken();

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await FirebaseInstance.init(DefaultFirebaseOptions.currentPlatform);
  }
}
