import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quranapp/core/routeing/routes.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/features/auth/login/presention/views/login_screen.dart';

import 'package:quranapp/features/auth/signup/presention/views/signup.dart';
import 'package:quranapp/features/auth/welcome/presention/welcome_view.dart';
import 'package:quranapp/features/home/presentation/manager/cubit_details/cubit/surah_details_cubit.dart';
import 'package:quranapp/features/home/presentation/view/home.dart';
import 'package:quranapp/features/home/presentation/view/search_view.dart';
import 'package:quranapp/features/home/presentation/view/widgets/bottom_nav.dart';
import 'package:quranapp/features/home/presentation/view/widgets/surah_details.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => WelcomeScreen()),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => const HomePage()),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: Routes.bottomnav,
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
  path: Routes.surahDetails,
  builder: (context, state) => BlocProvider(
    create: (context) => sl<SurahDetailsCubit>()..getSurahDetails((state.extra as int).toString()),
    child: const SurahDetails(
      title: 'الفاتحة',
      translation: 'The Opening',
      audioUrl: '...',
    ),
  ),
),

  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Page not found'))),
);
