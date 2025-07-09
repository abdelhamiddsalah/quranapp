import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/features/home/presentation/manager/cubit_details/cubit/surah_details_cubit.dart';
import 'package:quranapp/features/home/presentation/view/widgets/aya_card.dart';
import 'package:quranapp/features/home/presentation/view/widgets/home_appbar.dart';
import 'package:quranapp/features/home/presentation/view/widgets/islamic_aya_today.dart';

class SurahDetails extends StatelessWidget {
  final String title;
  final String translation;
  final String audioUrl;

  const SurahDetails({
    super.key,
    required this.title,
    required this.translation,
    required this.audioUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: BlocBuilder<SurahDetailsCubit, SurahDetailsState>(
          builder: (context, state) {
            if (state is SurahDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SurahDetailsError) {
              return Center(child: Text(state.message));
            } else if (state is SurahDetailsLoaded) {
              final surah = state.response.surah;
              final ayat = state.response.ayat;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    HomeAppBar(title: surah.nameArabic),
                    const SizedBox(height: 16.0),
                    IslamicVerseContainer(
                      title: surah.nameArabic,
                      detailtitle: '${surah.nameArabic} - آية 1',
                    ),
                    const SizedBox(height: 16.0),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        final ayah = ayat[index];
                        return QuranCard(
                          ayah: ayah,
                          surah: surah ,
                        );
                      },
                      itemCount: ayat.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
