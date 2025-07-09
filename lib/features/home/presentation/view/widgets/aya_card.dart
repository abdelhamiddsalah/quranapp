import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quranapp/colorss.dart';
import 'package:quranapp/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:quranapp/features/home/data/models/aya_model.dart';
import 'package:quranapp/features/home/data/models/surah_model.dart';

class QuranCard extends StatefulWidget {
  final AyahModel ayah;
  final SurahModel surah;

  const QuranCard({super.key, required this.ayah, required this.surah});

  @override
  State<QuranCard> createState() => _QuranCardState();
}

class _QuranCardState extends State<QuranCard> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed && mounted) {
        setState(() => _isPlaying = false);
      }
    });

    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final isFav = await context
        .read<FavoriteCubit>()
        .checkIfFavorite(widget.surah.id, widget.ayah.ayaNumber);
    if (mounted) {
      setState(() => _isFavorite = isFav);
    }
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
        setState(() => _isPlaying = false);
      } else {
        setState(() => _isPlaying = true);
        await _audioPlayer.setUrl(widget.ayah.audioUrl);
        await _audioPlayer.play();
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isPlaying = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("فشل في تشغيل الصوت")),
        );
      }
    }
  }

  Future<void> _handleAddFavorite() async {
    await context
        .read<FavoriteCubit>()
        .addFavorite(widget.surah.id, widget.ayah.ayaNumber);
    setState(() => _isFavorite = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تمت إضافة الآية إلى المفضلة')),
    );
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
                  icon: _isFavorite ? Icons.favorite : Icons.favorite_border,
                  label: _isFavorite ? 'مضافة' : 'إضافة للمفضلة',
                  color: _isFavorite ? Colors.red : primaryGreen,
                  color2: Colors.white,
                  onPressed: _isFavorite ? null : _handleAddFavorite,
                ),
                const SizedBox(width: 8),
                _buildIconButton(
                  icon: _isPlaying ? Icons.stop : Icons.play_circle_fill,
                  label: _isPlaying ? 'إيقاف' : 'تشغيل',
                  color: primaryGreen,
                  color2: Colors.white,
                  onPressed: _togglePlayPause,
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
    required VoidCallback? onPressed,
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
