import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offers/data/repositories/auth_repository.dart';
import 'package:offers/logic/auth/auth_bloc.dart';

class BlocProviders extends StatelessWidget {
  final Widget child;
  const BlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
      child: child,
    );
  }
}
