import 'package:flutter/material.dart';
import 'package:quranapp/home.dart';
import 'package:quranapp/widgets/favourite_widget.dart';
import 'package:quranapp/widgets/profile.dart';
import 'package:quranapp/widgets/quran_search_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 4;

  final List<Widget> _pages = [
    ProfileScreen(),
    FavoriteVerses(),
    BookmarksPage(),
    QuranSearchWidget(),
    HomePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget fixedEmoji(String emoji) {
    return Text(
      emoji,
      style: const TextStyle(fontSize: 24),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl, // عشان الأيقونات تبقى من اليمين للشمال
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
            BottomNavigationBarItem(
              icon: fixedEmoji('❤️'),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: fixedEmoji('🧠'),
              label: 'الحفظ',
            ),
            BottomNavigationBarItem(
              icon: fixedEmoji('🔍'),
              label: 'البحث',
            ),
            BottomNavigationBarItem(
              icon: fixedEmoji('🏠'),
              label: 'الرئيسية',
            ),
          ],
        ),
      ),
    );
  }
}



// صفحة المحفوظات
class BookmarksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المحفوظات'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark,
              size: 100,
              color: Colors.orange,
            ),
            SizedBox(height: 20),
            Text(
              'المحفوظات',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


// صفحة الملف الشخصي
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الملف الشخصي'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 100,
              color: Colors.purple,
            ),
            SizedBox(height: 20),
            Text(
              'الملف الشخصي',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}