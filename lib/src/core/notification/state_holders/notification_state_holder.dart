import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationStateHolder extends StateNotifier<String?> {
  NotificationStateHolder() : super(null);

  void setToken(String token) {
    if (!mounted) return;

    state = token;
  }

  void clear() {
    if (!mounted) return;

    state = null;
  }
}
