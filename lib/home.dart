import 'package:flutter/material.dart';
import 'package:quranapp/widgets/home_appbar.dart';
import 'package:quranapp/widgets/islamic_aya_today.dart';
import 'package:quranapp/widgets/quick_action_control.dart';
import 'package:quranapp/widgets/titles_surahs_lists.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
