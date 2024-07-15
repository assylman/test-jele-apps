import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_jele_apps/src/core/firebase/firebase_instance.dart';
import 'package:test_jele_apps/src/core/firebase/options/firebase_options.dart';
import 'package:test_jele_apps/src/core/navigation/go_router.dart';

void main() async {
  await run();
}

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await FirebaseInstance.init(
      DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Failed to init Firebase');
  }

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Test Jele Apps',
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
    );
  }
}
