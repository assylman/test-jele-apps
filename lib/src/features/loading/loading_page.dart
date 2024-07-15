import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:test_jele_apps/src/core/navigation/providers.dart';
import 'package:test_jele_apps/src/core/notification/providers.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  @override
  void initState() {
    super.initState();

    ref.read(notificationManagerProvider).init(context);
    ref.read(notificationManagerProvider).getToken();

    Future.delayed(const Duration(milliseconds: 2000), () {
      ref.read(navigationManagerProvider).go('/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Jele Apps'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
