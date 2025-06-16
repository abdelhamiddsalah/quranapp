import 'package:flutter/material.dart';
import 'package:quranapp/colorss.dart';

class QuranCard extends StatelessWidget {
  const QuranCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '﴿ بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ ﴾',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Amiri',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconButton(
                  icon: Icons.favorite,
                  label: 'إضافة للمفضلة',
                  color: primaryGreen,
                ),
                const SizedBox(width: 8),
                _buildIconButton(
                  icon: Icons.play_circle_fill,
                  label: 'تشغيل',
                  color: primaryGreen,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                text: 'التفسير: ',
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text:
                        'البسملة آية من آيات القرآن الكريم، وهي أول آية في سورة الفاتحة...',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(label,style: TextStyle(color: Colors.white),),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        textStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
