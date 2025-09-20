import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/constants/text.dart';
import 'package:tiktokfinalproject/features/authentication/repos/authentication_repo.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: TextConstants.titleSize,
            fontWeight: TextConstants.titleWeight,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Paddings.moodScreenHorizontal),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Log out",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: TextConstants.titleSize,
                ),
              ),
              textColor: Theme.of(context).primaryColor,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("Are you sure?"),
                    content: Text("Plx dont go"),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("No"),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          ref.read(authRepo).signOut();
                          context.go("/");
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
