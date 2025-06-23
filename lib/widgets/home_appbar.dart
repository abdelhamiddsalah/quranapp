import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/colorss.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.tajawal(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: Container(
                  padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: const Icon(Icons.light_mode_sharp, color: iconColor),
              ),
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: const Icon(Icons.notifications, color: iconColor),
              ),
              onPressed: () {
                // Implement notifications functionality
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
