import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:quranapp/features/home/presentation/view/widgets/home_appbar.dart';

class FavoriteVerses extends StatelessWidget {
  const FavoriteVerses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoriteCubit>()..getFavorites(),
      child: Scaffold(
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
                        children: [
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
                      BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, state) {
                          if (state is FavoriteLoaded) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: ListView.builder(
                                itemCount: state.favorites.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return _verseItem(
                                    title: state.favorites[index].aya.ayaText,
                                    subtitle:
                                        "سورة ${state.favorites[index].surah.name} - آية ${state.favorites[index].aya.ayaNumber}",
                                  );
                                },
                              ),
                            );
                          } else if (state is FavoriteLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is FavoriteError) {
                            return Center(child: Text(state.message));
                          }
                          return const Center(
                            child: Text('لا توجد آيات مفضلة بعد.'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verseItem({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
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
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
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
