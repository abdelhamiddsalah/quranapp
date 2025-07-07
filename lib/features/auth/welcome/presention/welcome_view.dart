import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quranapp/colorss.dart';
import 'package:quranapp/core/cache/cache_helper.dart';
import 'package:quranapp/core/routeing/routes.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // بيانات الصفحات
  final List<Map<String, dynamic>> _pages = [
    {
      'icon': Icons.menu_book,
      'title': 'مرحباً بك في القرآن الكريم',
      'description':
          'اقرأ واستمع لكلام الله الكريم بأجمل الأصوات وأوضح التفاسير',
      'color': iconColor,
    },
    {
      'icon': Icons.headphones,
      'title': 'استمع بأجمل الأصوات',
      'description':
          'تمتع بتلاوات مختارة من أشهر القراء حول العالم بجودة عالية',
      'color': Colors.orange,
    },
    {
      'icon': Icons.bookmark,
      'title': 'احفظ واستذكر',
      'description': 'ضع إشارات مرجعية على آياتك المفضلة وراجعها في أي وقت',
      'color': Colors.purple,
    },
    {
      'icon': Icons.search,
      'title': 'ابحث واستكشف',
      'description': 'ابحث في القرآن الكريم واستكشف التفاسير والمعاني',
      'color': Colors.teal,
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      if (CacheHelper.sharedPreferences.getString('token') != null) {
        GoRouter.of(context).go(Routes.bottomnav);
      } else {
        GoRouter.of(context).go(Routes.register);
      }
    }
  }

  void _skipToEnd() {
    GoRouter.of(context).push(Routes.register);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [lightGreen, primaryGreen],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // شريط التقدم العلوي
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_currentPage + 1} / ${_pages.length}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: _skipToEnd,
                      child: Text(
                        'تخطي',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // مؤشر التقدم
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: List.generate(
                    _pages.length,
                    (index) => Expanded(
                      child: Container(
                        height: 4,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: _currentPage >= index
                              ? Colors.white
                              : Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // محتوى الصفحات
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                    _animationController.reset();
                    _animationController.forward();
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: _buildPage(_pages[index]),
                    );
                  },
                ),
              ),

              // الأزرار السفلية
              Container(
                padding: EdgeInsets.all(24),
                child: Row(
                  children: [
                    if (_currentPage > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: backgroundColor,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            side: BorderSide(color: backgroundColor, width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back_ios, size: 16),
                              SizedBox(width: 8),
                              Text(
                                'السابق',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    if (_currentPage > 0) SizedBox(width: 16),

                    Expanded(
                      flex: _currentPage == 0 ? 1 : 1,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backgroundColor,
                          foregroundColor: primaryGreen,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentPage == _pages.length - 1
                                  ? 'ابدأ الآن'
                                  : 'التالي',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              _currentPage == _pages.length - 1
                                  ? Icons.rocket_launch
                                  : Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(Map<String, dynamic> pageData) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // الأيقونة الرئيسية مع حركة
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 800),
            builder: (context, value, child) {
              return Transform.scale(
                scale: 0.8 + (0.2 * value),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.15),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // دوائر خلفية للتأثير
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.white.withOpacity(0.1),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 15,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Icon(
                            pageData['icon'],
                            size: 72,
                            color: pageData['color'],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 60),

          // العنوان مع حركة تدريجية
          TweenAnimationBuilder<Offset>(
            tween: Tween(begin: Offset(0, 50), end: Offset.zero),
            duration: Duration(milliseconds: 600),
            builder: (context, offset, child) {
              return Transform.translate(
                offset: offset,
                child: Opacity(
                  opacity: 1 - (offset.dy / 50),
                  child: Text(
                    pageData['title'],
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 24),

          // الوصف مع حركة تدريجية
          TweenAnimationBuilder<Offset>(
            tween: Tween(begin: Offset(0, 30), end: Offset.zero),
            duration: Duration(milliseconds: 800),
            builder: (context, offset, child) {
              return Transform.translate(
                offset: offset,
                child: Opacity(
                  opacity: 1 - (offset.dy / 30),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      pageData['description'],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 40),

          // نقاط ملونة للزينة
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 400 + (index * 200)),
                builder: (context, value, child) {
                  return Container(
                    width: 12,
                    height: 12,
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3 + (0.4 * value)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
