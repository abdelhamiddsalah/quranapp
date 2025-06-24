
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quranapp/colorss.dart';
import 'package:quranapp/core/routeing/routes.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              lightGreen,
              primaryGreen,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // الدائرة الرئيسية مع أيقونة الكتاب
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.menu_book,
                        size: 64,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 48),
                
                // النص الترحيبي
                Text(
                  'مرحباً بك في القرآن الكريم',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 24),
                
                Text(
                  'اقرأ واستمع لكلام الله الكريم بأجمل الأصوات وأوضح التفاسير في تطبيق واحد سهل الاستخدام',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 48),
                
                // الأزرار
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                        GoRouter.of(context).push(Routes.register);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backgroundColor,
                          foregroundColor: primaryGreen,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'التالي',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(width: 16),
                    
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                       GoRouter.of(context).push(Routes.register);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: backgroundColor,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          side: BorderSide(color: backgroundColor, width: 2),
                        ),
                        child: Text(
                          'تخطي',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}