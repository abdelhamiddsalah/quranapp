import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:quranapp/core/cache/cache_helper.dart';
import 'package:quranapp/core/routeing/app_routing.dart';

import 'depency_injection.dart';


void main() {
    setup();
    
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

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

       routerConfig:  router, 
    );
  }
}
