import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quranapp/widgets/bottom_nav.dart';
import 'package:quranapp/widgets/surah_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
        locale: Locale('ar', 'EG'), // تعيين اللغة إلى العربية (مصر)
  supportedLocales: [
    Locale('en', 'US'), // اللغة الإنجليزية
    Locale('ar', 'EG'), // اللغة العربية
  ],
  localizationsDelegates: [
    // ... app-specific localization delegate[s] here
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
      home:  SurahDetails(
        title: 'سورة الفاتحة',
        translation: 'الفاتحة - السورة 1',
        audioUrl: 'https://example.com/audio.mp3',
      )
    );
  }
}
