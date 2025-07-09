import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/features/auth/signup/presention/manger/cubit/signup_cubit.dart';
import 'package:quranapp/features/auth/signup/presention/views/widgets/signup_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignupCubit>(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: const SignupScreenBody(),
      ),
    );
  }
}
