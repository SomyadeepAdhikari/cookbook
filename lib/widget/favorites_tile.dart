import 'package:cookbook/model/favorites_database.dart';
import 'package:cookbook/pages/information.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesTile extends StatefulWidget {
  final int realID;
  final int id;
  final String title;
  final String image;
  const FavoritesTile(
      {super.key,
      required this.realID,
      required this.id,
      required this.title,
      required this.image});

  @override
  State<FavoritesTile> createState() => _FavoritesTileState();
}

class _FavoritesTileState extends State<FavoritesTile> {
  void removeFavorite(int id) {
    context.read<FavoritesDatabase>().deleteFavorite(id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Information(
                name: widget.title, id: widget.realID, image: widget.image)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade100),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(12.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 40,
            child: Image.network(
              widget.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          title: Text(widget.title),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text(
                          'Are you sure, you want to remove it from favorites?',
                          style: TextStyle(
                            fontFamily: 'ArialRounded',
                            fontSize: 20,
                          ),
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              removeFavorite(widget.id);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'delete',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'ArialRounded'),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'cancel',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'ArialRounded'),
                            ),
                          )
                        ],
                      ));
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
