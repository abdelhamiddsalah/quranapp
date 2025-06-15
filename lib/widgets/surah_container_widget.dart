import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/colorss.dart';

class SurahContainerWidget extends StatelessWidget {
  final String surahName;
  final int surahNumber;
  final int ayahCount;
  final String revelationPlace;

  const SurahContainerWidget({
    super.key,
    required this.surahName,
    required this.surahNumber,
    required this.ayahCount,
    required this.revelationPlace,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // اسم السورة والمعلومات (يسار)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // محاذاة يسار
                children: [
                  Text(
                    surahName,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$ayahCount آيات • $revelationPlace',
                    style: GoogleFonts.tajawal(
                      color: Colors.grey[600],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // رقم السورة داخل دائرة خضراء (يمين)
            CircleAvatar(
              backgroundColor: primaryGreen,
              child: Text(
                surahNumber.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
