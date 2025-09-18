import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokfinalproject/common/main_navigation/widgets/nav_tab.dart';
import 'package:tiktokfinalproject/constants/box.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/constants/sizes.dart';
import 'package:tiktokfinalproject/features/mood/mood_screen.dart';
import 'package:tiktokfinalproject/features/post/mood_post_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "post",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: MoodScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: MoodPostScreen(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: Paddings.bottomAppBarTop,
          right: Paddings.bottomAppBarHorizontal,
          left: Paddings.bottomAppBarHorizontal,
          bottom: MediaQuery.of(context).padding.bottom +
              Paddings.bottomAppBarBottom,
        ),
        height: size.height * 0.1,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: BoxConstants.borderNormal,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavTab(
              onTap: () => _onTap(0),
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
            ),
            NavTab(
              onTap: () => _onTap(1),
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.pen,
            ),
          ],
        ),
      ),
    );
  }
}
