import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/widgets/home_appbar.dart';

class FavoriteVerses extends StatelessWidget {
  const FavoriteVerses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
           padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(
          children: [
            HomeAppBar(title: 'المفضلة'),
            const SizedBox(height: 16),
            Center(
              child: Container(
                
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
             width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان
                    Row(
                      children:  [
                        Text('❤️', style: TextStyle(fontSize: 20)),
                        SizedBox(width: 8),
                        Text(
                          "الآيات المفضلة",
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
            
                    // العنصر الأول
                    _verseItem(
                      title: "آية الكرسي",
                      subtitle: "سورة البقرة - آية 255",
                    ),
            
                  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _verseItem({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // زر التشغيل
        
      
          // النصوص
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
            ],
          ),
              const SizedBox(width: 12),
            Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.play_arrow, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
