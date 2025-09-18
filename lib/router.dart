import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokfinalproject/features/authentication/repos/authentication_repo.dart';
import 'package:tiktokfinalproject/features/authentication/views/login_screen.dart';
import 'package:tiktokfinalproject/features/authentication/views/sign_up_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      print("is logged in? $isLoggedIn");
      if (!isLoggedIn) {
        if (state.subloc != LoginScreen.routeUrl &&
            state.subloc != SignUpScreen.routeUrl) {
          return LoginScreen.routeUrl;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeUrl,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeUrl,
        builder: (context, state) => LoginScreen(),
      ),
    ],
  );
});
