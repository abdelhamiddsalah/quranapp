import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:quranapp/features/favorite/presentation/view/widgets/favorite_card.dart';
import 'package:quranapp/features/home/presentation/view/widgets/home_appbar.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteError) {
            return Center(child: Text(state.message));
          } else if (state is FavoriteLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const HomeAppBar(title: ' المفضلة'),
                    ListView.builder(
                    itemBuilder: (context, index) {
                      final ayah = state.favorites[index];
                      return FavoriteCard(ayah: ayah);
                    },
                    itemCount: state.favorites.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            );
          }
          return const SizedBox(); // لو مفيش حالة
        },
      ),
    );
  }
}