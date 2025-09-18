import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokfinalproject/features/authentication/repos/authentication_repo.dart';
import 'package:tiktokfinalproject/features/authentication/views/login_screen.dart';
import 'package:tiktokfinalproject/utils.dart';

class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(
      BuildContext context, String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _authRepo.emailSignUp(
        email,
        password,
      ),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(
        context,
        state.error,
      );
    } else {
      context.goNamed(LoginScreen.routeName);
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);
