import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/features/home/presentation/manager/search_cubit/search_by_aya_cubit.dart';
import 'package:quranapp/features/home/presentation/view/widgets/quran_search_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:  sl<SearchByAyaCubit>(),
      child: SafeArea(
        child: Scaffold(backgroundColor: Colors.white
        ,body: QuranSearchWidget(),
        ),
      ),
    );
  }
}
