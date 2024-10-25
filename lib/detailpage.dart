import 'package:flutter/material.dart';
import 'package:recipesapi_example/recipes_model.dart';

class RecipeDetailPage extends StatelessWidget{
  final Recipe recipe;
  const RecipeDetailPage({required this.recipe});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text(recipe.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.pink,
      ),
      body: Padding(padding: 
      EdgeInsets.all(15.0),
      child: ListView.builder(itemBuilder: (context,index){
        return Container(
          child: Column(
            children: [Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(recipe.image))
              ),
            ),
            Text("Name:${recipe.name}",
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
            
            ),
            SizedBox(height: 5),
            Text("Cuisine:${recipe.cuisine}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 5),
            Text("Ingragients:${recipe.ingredients}",),
            SizedBox(height: 5),
            Text("Instructions",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5),
            
            ],
          ),
        );
      }),
      ),
    );
  }
}