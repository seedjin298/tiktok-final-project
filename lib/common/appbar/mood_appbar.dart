import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokfinalproject/constants/text.dart';
import 'package:tiktokfinalproject/features/settings/settings_screen.dart';

class MoodAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLoggedIn;

  const MoodAppBar({
    super.key,
    required this.isLoggedIn,
  });

  void _onGearPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      title: Text(
        "🔥 MOOD 🔥",
        style: TextStyle(
          fontWeight: FontWeight.w900,
        ),
      ),
      actions: [
        if (isLoggedIn)
          IconButton(
            onPressed: () => _onGearPressed(context),
            icon: FaIcon(
              FontAwesomeIcons.gear,
              size: TextConstants.appbarGearSize,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
