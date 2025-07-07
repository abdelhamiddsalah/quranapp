import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/features/auth/profile/presention/manger/cubit/profile_cubit.dart';
import 'package:quranapp/features/auth/profile/presention/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:sl<ProfileCubit>()..getProfile(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'الملف الشخصي',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.amber),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.wb_sunny, color: Colors.amber),
                onPressed: () {},
              ),
            ],
          ),
          body: const ProfileViewBody(),
        ),
      ),
    );
  }
}
