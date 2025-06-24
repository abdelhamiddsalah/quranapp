import 'package:flutter/material.dart';
import 'package:quranapp/features/auth/login/presention/views/widgets/login_screen_body.dart';

class ProfileScreen  extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: const LoginScreenBody(),
    );
  }
}
