import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offers/logic/auth/auth_bloc.dart';

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
              Navigator.of(context).pushNamed<User?>('/login').then((
                User? value,
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
      body: Center(
        child: const Text(
          'Welcome! You are logged in.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
