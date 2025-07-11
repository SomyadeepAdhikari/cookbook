import 'dart:developer';

import 'package:cookbook/model/favorite.dart';
import 'package:cookbook/model/favorites_database.dart';
import 'package:cookbook/pages/information.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridRecipeCard extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  const GridRecipeCard(
      {super.key, required this.id, required this.title, required this.image});

  @override
  State<GridRecipeCard> createState() => _GridRecipeCardState();
}

class _GridRecipeCardState extends State<GridRecipeCard> {
  late bool isfav;
  @override
  void initState() {
    isfav = checkIfFav(widget.id);
    super.initState();
  }
  bool checkIfFav(int recipeId) {
    Favorite currentItem;
    for (currentItem in context.read<FavoritesDatabase>().currentFavorites) {
      if (currentItem.realid == recipeId) {
        return true;
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    // bool isfav = context.read<>
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(1, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(0),
        width: ((MediaQuery.of(context).size.width / 2) - 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Information(
                  name: widget.title, id: widget.id, image: widget.image);
            }));
          },
          child: Column(
            children: [
              ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  )),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(widget.title,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isfav = !isfav;
                          if (isfav) {
                            log('message1');
                            context.read<FavoritesDatabase>().addFavorite(
                                widget.title, widget.id, widget.image);
                          } else {
                            log('2');
                            context
                                .read<FavoritesDatabase>()
                                .deleteId(widget.id);
                          }
                        });
                      },
                      color: isfav ? Colors.red : Colors.black38,
                      icon: const Icon(Icons.favorite))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
