import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktokfinalproject/features/authentication/views/sign_up_screen.dart';
import 'package:tiktokfinalproject/firebase_options.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Final Project',
      themeMode: ThemeMode.light,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFece7c6),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFece7c6),
          )),
      home: SignUpScreen(),
    );
  }
}
