import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/home.dart';

import 'package:quranapp/core/cache/cache_helper.dart';
import 'package:quranapp/depency_injection.dart';

import 'package:quranapp/features/auth/signup/presention/views/signup.dart';

void main() {
    setup();
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
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

      home:  HomePage()
    );
  }
}
