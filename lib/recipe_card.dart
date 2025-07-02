import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final int currentPage;
  const RecipeCard(
      {super.key, required this.id, required this.title, required this.image, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow:const <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(102, 180, 124, 1),
                blurRadius: 4,
                offset: Offset(0.0, 0.0))
          ],
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(0),
        width: (currentPage==1)?((MediaQuery.of(context).size.width/2) - 20.0): (MediaQuery.of(context).size.width-20),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  width: double.infinity,
                )),
            Row(
              children: [
                Expanded(
                    child: Text(title, style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1, overflow: TextOverflow.ellipsis)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
              ],
            )
          ],
        ),
      ),
    );
  }
}
