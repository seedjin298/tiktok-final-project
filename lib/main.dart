import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktokfinalproject/firebase_options.dart';
import 'package:tiktokfinalproject/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      title: 'TikTok Final Project',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFece7c6),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFece7c6),
        ),
        primaryColor: Color(0xfff3aaf2),
      ),
    );
  }
}
