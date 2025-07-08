import 'package:cookbook/model/favorite.dart';
import 'package:cookbook/model/favorites_database.dart';
import 'package:cookbook/widget/favorites_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    readFavorites();
    super.initState();
  }

  void readFavorites() {
    context.read<FavoritesDatabase>().fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteDatabase = context.watch<FavoritesDatabase>();
    List<Favorite> currentFavorites = favoriteDatabase.currentFavorites;
    return RefreshIndicator(
      onRefresh: () async {
        readFavorites();
      },
      child: ListView.builder(
          itemCount: currentFavorites.length,
          itemBuilder: (context, index) {
            final currentFavorite = currentFavorites[index];
            return FavoritesTile(
                realID: currentFavorite.realid,
                id: currentFavorite.id,
                title: currentFavorite.name,
                image: currentFavorite.image);
          }),
    );
  }
}
