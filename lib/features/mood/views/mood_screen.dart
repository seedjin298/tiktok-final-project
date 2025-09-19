import 'package:flutter/material.dart';
import 'package:tiktokfinalproject/common/appbar/mood_appbar.dart';

class MoodScreen extends StatelessWidget {
  static const routeUrl = "/home";
  static const routeName = "home";

  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoodAppBar(),
      body: Center(
        child: Text("Mood Screen"),
      ),
    );
  }
}
