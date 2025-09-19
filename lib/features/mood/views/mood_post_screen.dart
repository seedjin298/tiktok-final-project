import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokfinalproject/common/appbar/mood_appbar.dart';
import 'package:tiktokfinalproject/common/button/submit_button.dart';
import 'package:tiktokfinalproject/constants/box.dart';
import 'package:tiktokfinalproject/constants/color.dart';
import 'package:tiktokfinalproject/constants/gaps.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/constants/text.dart';
import 'package:tiktokfinalproject/features/mood/view_models/upload_mood_view_model.dart';
import 'package:tiktokfinalproject/features/mood/views/mood_screen.dart';
import 'package:tiktokfinalproject/features/mood/views/widgets/mood_button.dart';

List<String> _moodList = [
  "😀",
  "😍",
  "😊",
  "🥳",
  "😭",
  "🤬",
  "🫠",
  "🤮",
];

Map<int, String> _moodMap = _moodList.asMap();

class MoodPostScreen extends ConsumerStatefulWidget {
  const MoodPostScreen({super.key});

  @override
  MoodPostScreenState createState() => MoodPostScreenState();
}

class MoodPostScreenState extends ConsumerState<MoodPostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _formFocusNode = FocusNode();

  final Map<String, String> _formData = {};

  bool _isPost = false;

  int _chosenIndex = _moodList.length;

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onMoodTap(int index) {
    _chosenIndex = index;
    _formData["mood"] = _moodList[index];
    setState(() {});
  }

  void _onPostTap() {
    _formFocusNode.unfocus();
    if (_isPost) return;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isPost = true;
      });
      ref
          .read(uploadMoodProvider.notifier)
          .uploadMood(_formData["mood"]!, _formData["comment"]!, context);
    }
  }

  @override
  void dispose() {
    _formFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: MoodAppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Paddings.moodScreenHorizontal,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "How do you feel?",
                      style: TextStyle(
                        fontSize: TextConstants.titleSize,
                        fontWeight: TextConstants.titleWeight,
                        letterSpacing: TextConstants.letterSpacing,
                      ),
                    ),
                    Gaps.v10,
                    Container(
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: BoxConstants.boxBorder,
                        borderRadius: BorderRadius.circular(
                          BoxConstants.moodFormBorderRadius,
                        ),
                        boxShadow: [
                          BoxConstants.boxShadowLeftBottom,
                        ],
                      ),
                      child: TextFormField(
                        focusNode: _formFocusNode,
                        cursorColor: ColorConstants.cursorColor,
                        decoration: InputDecoration(
                          hintText: "Write it down here!",
                          hintStyle: TextStyle(
                            color: ColorConstants.moodHintTextColor,
                            fontSize: TextConstants.normalSize,
                            fontWeight: TextConstants.normalWeight,
                            letterSpacing: TextConstants.letterSpacing,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: Paddings.moodTextFormFieldHorizontal,
                            vertical: Paddings.moodTextFormFieldVertical,
                          ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onSaved: (newValue) {
                          if (newValue != null) {
                            _formData['comment'] = newValue;
                          }
                        },
                      ),
                    ),
                    Gaps.v36,
                    Text(
                      "What's your mood?",
                      style: TextStyle(
                        fontSize: TextConstants.titleSize,
                        fontWeight: TextConstants.titleWeight,
                        letterSpacing: TextConstants.letterSpacing,
                      ),
                    ),
                    Gaps.v12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var entry in _moodMap.entries)
                          GestureDetector(
                            onTap: () => _onMoodTap(entry.key),
                            child: MoodButton(
                              mood: entry.value,
                              isChosen: entry.key == _chosenIndex,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Gaps.v60,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Paddings.moodSubmitButtonHorizontal,
                  ),
                  child: GestureDetector(
                    onTap: () => _onPostTap(),
                    child: SubmitButton(
                      buttonText: "Post",
                      isSubmit: ref.watch(uploadMoodProvider).isLoading,
                    ),
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
