import 'package:flutter/material.dart';
import 'package:quranapp/features/saving/presentation/widgets/saving_surah_view_body.dart';

class SaveSurahView extends StatelessWidget {
  const SaveSurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MemorizationScreen(),
    );
  }
}