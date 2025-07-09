import 'package:flutter/material.dart';
import 'package:quranapp/features/home/presentation/view/widgets/home_appbar.dart';
import 'package:quranapp/features/home/presentation/view/widgets/islamic_aya_today.dart';
import 'package:quranapp/features/home/presentation/view/widgets/quick_action_control.dart';
import 'package:quranapp/features/home/presentation/view/widgets/titles_surahs_lists.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
              HomeAppBar(title: 'الرئيسية'),
                SizedBox(height: 16),
                IslamicVerseContainer(),
                SizedBox(height: 16),
                QuickActionsContainer(),
                SizedBox(height: 16),
                TitlesSurahsLists(),
              ],
            ),
          ),
        )
      ),
    );
  }
}
