import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/features/auth/profile/presention/manger/cubit/profile_cubit.dart';
import 'package:quranapp/features/auth/profile/presention/views/profile_view.dart';
import 'package:quranapp/features/favorite/presentation/view/favorite_view.dart';
import 'package:quranapp/features/home/presentation/view/home.dart';
import 'package:quranapp/features/home/presentation/view/search_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 3;

  final List<Widget> _pages = [
    BlocProvider.value(value: sl<ProfileCubit>()..getProfile(), child: ProfileView()),
    FavoriteView(),  
      SearchView(),

    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget fixedEmoji(String emoji) {
    return Text(emoji, style: const TextStyle(fontSize: 24));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Directionality(
        textDirection:
            TextDirection.rtl, // عشان الأيقونات تبقى من اليمين للشمال
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedItemColor: Colors.black, // مش هيأثر عالإيموجي
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: fixedEmoji('👤'),
              label: 'الملف الشخصي',
            ),
            BottomNavigationBarItem(icon: fixedEmoji('❤️'), label: 'المفضلة'),
            BottomNavigationBarItem(icon: fixedEmoji('🔍'), label: 'البحث'),
            BottomNavigationBarItem(icon: fixedEmoji('🏠'), label: 'الرئيسية'),
          ],
        ),
      ),
    );
  }
}
