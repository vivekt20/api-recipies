import 'dart:convert';


import 'package:flutter/material.dart';


import 'package:http/http.dart'as http;
import 'package:recipesapi_example/detailpage.dart';
import 'package:recipesapi_example/recipes_model.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  bool _isLoading=true;

  @override

void initState(){
  super.initState();
  _getData();
}
ProductModelApi 
?dataFromApi;
_getData()async{
  try{
    String url="https://dummyjson.com/recipes" ;
    http.Response res=await http.get(Uri.parse(url));
    if(res.statusCode==200){
      dataFromApi=ProductModelApi.fromJson(json.decode(res.body));
      _isLoading=false;
      setState(() {
        
      });
    }
  }catch(e){
    debugPrint(e.toString());
  }
}
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "REST API EXAMPLE",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 180, 15, 3),
    ),
    body: _isLoading
    ?const Center(
      child: CircularProgressIndicator(),

    )
    : dataFromApi ==null?
    const Center(
      child: Text("Failed to load data"),
    )
    : GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemCount: dataFromApi!.recipes.length,itemBuilder: (context,index){
      final Recipe=dataFromApi!.recipes[index];
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>RecipeDetailPage(recipe: Recipe)));

        },
      
       child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 243, 242, 242),
              blurRadius: 0,
              spreadRadius: 1,
            )
          ]
        ),
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(Recipe.image,
            width: 100,height: 100,
            ),
             SizedBox(height: 10),
            Text(Recipe.name),
            SizedBox(height: 5),
            Row(
              children: [
                Text(Recipe.cuisine),
                SizedBox(width: 25),
          ],
          
            
        ),
        
          ]
      )),
      );
      

    })
  
  );
}
}