import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktokfinalproject/common/appbar/mood_appbar.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/constants/sizes.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: MoodAppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            right: Paddings.authenticationHorizontal,
            left: Paddings.authenticationHorizontal,
            bottom: Paddings.authenticationVertical,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Welcome!"),
                  TextFormField(),
                  TextFormField(),
                  FractionallySizedBox(
                    widthFactor: 1.0,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xfff3aaf2),
                      ),
                      child: Text("Enter"),
                    ),
                  ),
                ],
              ),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xfff3aaf2),
                  ),
                  child: Text("Log in →"),
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: Paddings.authenticationHorizontal,
      //   ),
      //   child: FractionallySizedBox(
      //     widthFactor: 1.0,
      //     child: Container(
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         color: Color(0xfff3aaf2),
      //       ),
      //       child: Text("Log in →"),
      //     ),
      //   ),
      // ),
    );
  }
}
