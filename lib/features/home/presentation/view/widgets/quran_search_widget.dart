import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/colorss.dart';
import 'package:quranapp/features/home/presentation/manager/search_cubit/search_by_aya_cubit.dart';
import 'package:quranapp/features/home/presentation/view/widgets/home_appbar.dart';
import 'package:quranapp/features/home/presentation/view/widgets/search_ruselt_card.dart';

class QuranSearchWidget extends StatefulWidget {
  const QuranSearchWidget({super.key});

  @override
  State<QuranSearchWidget> createState() => _QuranSearchWidgetState();
}

class _QuranSearchWidgetState extends State<QuranSearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Column(
        children: [
          HomeAppBar(title: 'البحث'),
          const SizedBox(height: 16),

          // صندوق البحث
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '🔍 البحث في القرآن الكريم',
                        style: GoogleFonts.tajawal(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // حقل البحث
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          textAlign: TextAlign.right,
                          onChanged: (text) {
                            context.read<SearchByAyaCubit>().getAyatBysearch(text);
                          },
                          decoration: InputDecoration(
                            hintText: 'ابحث في الآيات...',
                            hintStyle: GoogleFonts.tajawal(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus(); // إخفاء الكيبورد
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: primaryGreen,
                            shape: BoxShape.circle,
                          ),
                          child: const Text('🔍'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // نتائج البحث
          Expanded(
            child: BlocBuilder<SearchByAyaCubit, SearchByAyaState>(
              builder: (context, state) {
                if (state is SearchByAyaLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchByAyaError) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: GoogleFonts.tajawal(fontSize: 16, color: Colors.red),
                    ),
                  );
                } else if (state is SearchByAyaLoaded) {
                  final searchResults = state.searchResults;
                  if (searchResults.isEmpty) {
                    return Center(
                      child: Text(
                        'لا توجد نتائج للبحث',
                        style: GoogleFonts.tajawal(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final searchModel = searchResults[index];
                        return SearchRuseltCard(searchModel: searchModel);
                      },
                    );
                  }
                } else {
                  return Center(
                    child: Text(
                      'أدخل كلمة للبحث',
                      style: GoogleFonts.tajawal(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
