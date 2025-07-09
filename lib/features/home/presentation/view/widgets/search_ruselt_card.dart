import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/colorss.dart';
import 'package:quranapp/features/home/data/models/search_model.dart';

class SearchRuseltCard extends StatelessWidget {
  final SearchModel searchModel;
  const SearchRuseltCard({super.key, required this.searchModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // معلومات السورة والآية
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'سورة ${searchModel.surahName}',
                  style: GoogleFonts.tajawal(
                    fontSize: 12,
                    color: primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'آية ${searchModel.ayaNumber}',
                  style: GoogleFonts.tajawal(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // نص الآية
          Text(
            searchModel.ayaText,
            textAlign: TextAlign.right,
            style: GoogleFonts.amiri(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),

          // زر الانتقال للسورة
        ],
      ),
    );
  }
}