import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/colorss.dart';
import 'package:quranapp/features/auth/profile/presention/manger/cubit/profile_cubit.dart';
import 'package:quranapp/features/auth/profile/presention/views/widgets/Build_menu_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User Profile Section
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccessState) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(color: primaryGreen),
    child: Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text('👤', style: TextStyle(fontSize: 30)),
          ),
        ),
        const SizedBox(height: 15),
         Text(
          state.usermodel.username  ,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'مستخدم منذ 6 أشهر',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    ),
  );
}else if (state is ProfileErrorState) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            }else  {
              return Container(
                    width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
              );
            } 
           
          },
        ),

        const SizedBox(height: 20),

        // Menu Items
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              BuildMenuItem(
                icon: Icons.notifications,
                title: 'التنبيهات',
                color: Colors.amber,
                onTap: () {},
              ),
              BuildMenuItem(
                icon: Icons.mobile_friendly,
                title: 'مشاركة التطبيق',
                color: Colors.blue,
                onTap: () {},
              ),
              BuildMenuItem(
                icon: Icons.star,
                title: 'تقييم التطبيق',
                color: Colors.amber,
                onTap: () {},
              ),
              BuildMenuItem(
                icon: Icons.help_outline,
                title: 'المساعدة',
                color: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
