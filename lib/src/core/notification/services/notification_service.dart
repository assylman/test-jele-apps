import 'package:flutter/widgets.dart';

abstract class NotificationService {
  Future<void> init(BuildContext context);
  Future<String?> getToken();
}
