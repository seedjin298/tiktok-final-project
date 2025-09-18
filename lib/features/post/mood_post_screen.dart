import 'package:flutter/material.dart';
import 'package:tiktokfinalproject/common/appbar/mood_appbar.dart';

class MoodPostScreen extends StatelessWidget {
  const MoodPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoodAppBar(),
      body: Center(
        child: Text("Mood Post Screen"),
      ),
    );
  }
}
