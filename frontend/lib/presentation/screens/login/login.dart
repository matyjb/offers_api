import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:offers/router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];
    return SignInScreen(
      providers: providers,
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          print("User signed in: ${state.user?.email}");
          Navigator.of(
            context,
          ).pushReplacementNamed(RouteNames.home, result: state.user);
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          print("User created: ${state.credential.user?.email}");
          Navigator.of(context).pushReplacementNamed(
            RouteNames.home,
            result: state.credential.user,
          );
        }),
      ],
    );
  }
}
