import 'package:flutter/material.dart';
import 'package:quranapp/widgets/aya_card.dart';
import 'package:quranapp/widgets/home_appbar.dart';
import 'package:quranapp/widgets/islamic_aya_today.dart';

class SurahDetails extends StatelessWidget {
  final String title;
  final String translation;
  final String audioUrl;

  const SurahDetails({
    Key? key,
    required this.title,
    required this.translation,
    required this.audioUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeAppBar(title: 'سورة الفاتحة'),
              SizedBox(height: 16.0),
              IslamicVerseContainer(
                title: 'سوره الفاتحة',
                detailtitle: 'سورة الفاتحة - آية 1',
              ),
          
              SizedBox(height: 16.0),
              ListView.builder(
                itemBuilder: (context, index) {
                  return QuranCard();
                },
                itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
