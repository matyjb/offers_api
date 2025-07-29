import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offers/logic/auth/auth_bloc.dart';
import 'package:offers/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.of(context).pushNamed<User?>(RouteNames.login).then((
                value,
              ) {
                if (value != null) {
                  if (context.mounted) {
                    context.read<AuthBloc>().add(
                      AuthEvent.changed(user: value),
                    );
                  }
                }
              });
            },
          ),
        ],
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Center(
            child: Text(switch (state) {
              AuthUnauthenticated _ => 'You are not logged in',
              AuthAuthenticated(user: final user) =>
                'Welcome, ${user.email ?? "Guest"}',
              AuthState() => 'Unknown state',
            }, style: TextStyle(fontSize: 18)),
          );
        },
      ),
    );
  }
}
