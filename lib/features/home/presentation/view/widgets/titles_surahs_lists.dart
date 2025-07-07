import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/routeing/routes.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/features/home/presentation/manager/surah_cubit/surahs_cubit.dart';
import 'package:quranapp/features/home/presentation/view/widgets/surah_container_widget.dart';

class TitlesSurahsLists extends StatelessWidget {
  const TitlesSurahsLists({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SurahsCubit>()..getSurahs(),
      child: BlocBuilder<SurahsCubit, SurahsState>(
        builder: (context, state) {
          if (state is SurahsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SurahsLoaded) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('📜', style: TextStyle(fontSize: 20)),
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
                  ListView.builder(
                    itemCount: state.surahs.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final surah = state.surahs[index];
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(Routes.surahDetails, extra: surah.id);
                        },
                        child: SurahContainerWidget(
                          surahName: surah.nameArabic,
                          revelationPlace: surah.revelationPlace,
                          ayahCount: surah.ayahCount,
                          surahNumber: surah.orderInMushaf,
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is SurahsError) {
            return Center(child: Text('حدث خطأ: ${state.message}'));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
