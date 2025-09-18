import 'package:flutter/material.dart';

class MoodAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MoodAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "🔥 MOOD 🔥",
        style: TextStyle(
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
