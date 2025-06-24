import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/features/auth/login/presention/manger/cubit/login_cubit.dart';
import 'package:quranapp/features/auth/login/presention/views/widgets/login_screen_body.dart';

class LoginScreen  extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: const LoginScreenBody(),
      ),
    );
  }
}
