import 'dart:convert';

import 'package:cookbook/recipe_card.dart';
import 'package:cookbook/util/secrets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DisplayTile extends StatefulWidget {
  final int currentPage;
  const DisplayTile({super.key,required this.currentPage});

  @override
  State<DisplayTile> createState() => _DisplayTileState();
}

class _DisplayTileState extends State<DisplayTile> {
  late Future<Map<String,dynamic>> recipes;
  
  @override
  void initState(){
    recipes=getRecipes();
    super.initState();
  }
  Future<Map<String,dynamic>> getRecipes() async{
    try{
      final res = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=$spoonacularapi'));
      final data = jsonDecode(res.body);
      if(data['totalresults'] == 0){
        throw 'data not found';
      }
      return data;
    }catch(e){
      throw e.toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: recipes, 
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color:  Color.fromARGB(255, 102, 180, 124),            strokeWidth: 5,));
        }
        if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        }
        final data=snapshot.data!;
        if (widget.currentPage==1) {
          return GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
            itemBuilder: (context, index) {
              final resultId = data['results'][index]['id'];
              final name = data['results'][index]['title'];
              final image = data['results'][index]['image'];
              return RecipeCard(
                id: resultId,
                image: image,
                title: name,
                currentPage: widget.currentPage,
              );
          },
        );
        } else {
          return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context,index){
            final resultId = data['results'][index]['id'];
            final name = data['results'][index]['title'];
            final image = data['results'][index]['image'];
            return RecipeCard(
              id: resultId,
              image: image,
              title: name,
              currentPage: widget.currentPage,
            );
          }
        );
        }
      } );
  }
}