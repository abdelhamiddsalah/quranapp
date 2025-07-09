import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/depency_injection.dart';
import 'package:quranapp/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:quranapp/features/favorite/presentation/view/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<FavoriteCubit>()..getFavorites(),
      child:  Scaffold(
        backgroundColor: Colors.white,
        body:FavoriteViewBody(),
      ),
    );
  }
}
