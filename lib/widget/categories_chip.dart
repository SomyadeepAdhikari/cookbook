import 'package:cookbook/pages/cuisines_page.dart';
import 'package:cookbook/widget/cusine_tile.dart';
import 'package:cookbook/globals.dart';
import 'package:flutter/material.dart';

class CategoriesChip extends StatefulWidget {
  const CategoriesChip({super.key});

  @override
  State<CategoriesChip> createState() => _CategoriesChipState();
}

class _CategoriesChipState extends State<CategoriesChip> {
  String selectedCuisine=cuisines[0];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: (MediaQuery.of(context).size.width / 3.5),
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedCuisine=cuisines[index];
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){
                          return CuisinesPage(cuisineSearch: selectedCuisine);
                        }));
                    },
                    child: CuisineTile(cuisineName: cuisines[index])
                  );
                }, 
                childCount: cuisines.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.35)
                )
          ],
        ));
  }
}
