// To parse this JSON data, do
//
//     final productModelApi = productModelApiFromJson(jsonString);

import 'dart:convert';

ProductModelApi productModelApiFromJson(String str) => ProductModelApi.fromJson(json.decode(str));

class ProductModelApi {
    List<Recipe> recipes;

    ProductModelApi({
        required this.recipes,
    });

    factory ProductModelApi.fromJson(Map<String, dynamic> json) => ProductModelApi(
        recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
    );
    
}

class Recipe {
    int id;
    String name;
    List<String> ingredients;
    List<String> instructions;
    String image;
    String cuisine;
  
    Recipe({
        required this.id,
        required this.name,
        required this.ingredients,
        required this.instructions,
        required this.image,
        required this.cuisine,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        name: json["name"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        image: json["image"],
        cuisine: json["cuisine"],
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
        "image": image,
        "cuisine":cuisine,
        
    };
}
