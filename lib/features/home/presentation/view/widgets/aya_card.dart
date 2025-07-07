import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quranapp/colorss.dart';
import 'package:quranapp/features/home/data/models/aya_model.dart';

class QuranCard extends StatefulWidget {
  final AyahModel ayah;

  const QuranCard({super.key, required this.ayah});

  @override
  State<QuranCard> createState() => _QuranCardState();
}

class _QuranCardState extends State<QuranCard> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // عند انتهاء الصوت نرجع زر التشغيل
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (mounted) {
          setState(() {
            _isPlaying = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() {
          _isPlaying = false;
        });
      } else {
        setState(() {
          _isPlaying = true; // تظهر الأيقونة مباشرة
        });
        await _audioPlayer.setUrl(widget.ayah.audioUrl);
        print("🎧 Playing audio from: ${widget.ayah.audioUrl}");
        await _audioPlayer.play();
      }
    } catch (e) {
      debugPrint("❌ Error playing audio: $e");
      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("فشل في تشغيل الصوت")));
      }
    }
  }

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
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '﴿ ${widget.ayah.ayaText} ﴾',
              style: const TextStyle(
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
                  color2: Colors.red,
                  onPressed: () {
                    // TODO: إضافة للمفضلة
                  },
                ),
                const SizedBox(width: 8),
                _buildIconButton(
                  icon: _isPlaying ? Icons.stop : Icons.play_circle_fill,
                  label: _isPlaying ? 'إيقاف' : 'تشغيل',
                  color: primaryGreen,
                  color2: Colors.white,
                  onPressed:()=>  _togglePlayPause()
                  ,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: 'التفسير: ',
                style: const TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: widget.ayah.ayaTafsir,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color color2,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color2),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
