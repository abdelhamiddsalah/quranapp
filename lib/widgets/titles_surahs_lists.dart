import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/widgets/surah_container_widget.dart';

class TitlesSurahsLists extends StatelessWidget {
  const TitlesSurahsLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // العنوان مع الأيقونة
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             
              Text('📜', style: TextStyle(fontSize: 20),),
              SizedBox(width: 8),
              Text(
                'السور',
                style: GoogleFonts.tajawal(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          SizedBox(height: 16),
          // الأزرار
         ListView.builder(itemBuilder: (context, index) {
            return SurahContainerWidget(surahName: 'الفاتحة', surahNumber: 1, ayahCount: 7, revelationPlace: 'مكية');
          }, itemCount: 114, shrinkWrap: true, physics: NeverScrollableScrollPhysics()),
        ],
      ),
    );
  }
}
 