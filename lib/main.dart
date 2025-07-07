import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:quranapp/core/cache/cache_helper.dart';
import 'package:quranapp/core/routeing/app_routing.dart';
import 'depency_injection.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.quranapp.channel.audio',
    androidNotificationChannelName: 'Quran Playback',
    androidNotificationOngoing: true,
  );

  await AudioSession.instance.then(
    (session) => session.configure(const AudioSessionConfiguration.music()),
  );

  setup(); // لو عندك DI
  await CacheHelper().init(); // لو Async

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
