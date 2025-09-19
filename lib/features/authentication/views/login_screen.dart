import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokfinalproject/common/appbar/mood_appbar.dart';
import 'package:tiktokfinalproject/common/button/submit_button.dart';
import 'package:tiktokfinalproject/constants/box.dart';
import 'package:tiktokfinalproject/constants/color.dart';
import 'package:tiktokfinalproject/constants/gaps.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/constants/sizes.dart';
import 'package:tiktokfinalproject/constants/text.dart';
import 'package:tiktokfinalproject/features/authentication/view_models/login_view_model.dart';
import 'package:tiktokfinalproject/features/authentication/views/sign_up_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/";
  static const routeName = "login";

  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  bool _obscureText = true;

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onAuthButtonTap(BuildContext context) {
    context.pushNamed(SignUpScreen.routeName);
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onLoginTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(loginProvider.notifier).login(
              _formData["email"]!,
              _formData["password"]!,
              context,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: MoodAppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
              right: Paddings.authScreenHorizontal,
              left: Paddings.authScreenHorizontal,
              bottom: Paddings.authScreenVertical,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        fontSize: TextConstants.titleSize,
                        fontWeight: TextConstants.titleWeight,
                      ),
                    ),
                    Gaps.v40,
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: ColorConstants.cursorColor,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: Paddings.authTextFormFieldHorizontal,
                          vertical: Paddings.authTextFormFieldVertical,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: ColorConstants.authHintTextColor,
                          fontSize: TextConstants.titleSize,
                          fontWeight: TextConstants.normalWeight,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: BoxConstants.borderThin,
                          ),
                          borderRadius: BorderRadius.circular(
                              BoxConstants.buttonBorderRadius),
                        ),
                        focusColor: ColorConstants.focusColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: BoxConstants.borderThin,
                          ),
                          borderRadius: BorderRadius.circular(
                              BoxConstants.buttonBorderRadius),
                        ),
                      ),
                      validator: (value) {
                        if (value == null) return null;
                        final regExp = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (!regExp.hasMatch(value)) {
                          return "Email not valid";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          _formData['email'] = newValue;
                        }
                      },
                    ),
                    Gaps.v12,
                    TextFormField(
                      cursorColor: ColorConstants.cursorColor,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: Paddings.authTextFormFieldHorizontal,
                          vertical: Paddings.authTextFormFieldVertical,
                        ),
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: _toggleObscureText,
                              child: FaIcon(
                                _obscureText
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                color: Colors.grey.shade500,
                                size: Sizes.size20,
                              ),
                            ),
                          ],
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: ColorConstants.authHintTextColor,
                          fontSize: TextConstants.titleSize,
                          fontWeight: TextConstants.normalWeight,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: BoxConstants.borderThin,
                          ),
                          borderRadius: BorderRadius.circular(
                              BoxConstants.buttonBorderRadius),
                        ),
                        focusColor: ColorConstants.focusColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: BoxConstants.borderThin,
                          ),
                          borderRadius: BorderRadius.circular(
                              BoxConstants.buttonBorderRadius),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.length < 8) {
                          return "Password should be 8 characters or more.";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          _formData['password'] = newValue;
                        }
                      },
                    ),
                    Gaps.v18,
                    GestureDetector(
                      onTap: _onLoginTap,
                      child: SubmitButton(
                        isSubmit: ref.watch(loginProvider).isLoading,
                        buttonText: "Enter",
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => _onAuthButtonTap(context),
                  child: SubmitButton(
                    buttonText: "Create an account →",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
