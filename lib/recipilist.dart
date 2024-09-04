import 'dart:convert';

import 'package:cookbook/recipi_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Recipilist extends StatefulWidget {
  const Recipilist({Key? key}) : super(key: key);

  @override
  State<Recipilist> createState() => _RecipilistState();
}

class _RecipilistState extends State<Recipilist> {
  List recipes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  Future<void> fetchRecipes()async
  {
    final response = await http.get(
      Uri.parse('https://api.spoonacular.com/recipes/random?number=10&apiKey=5d1a3710d32b4ff5ba6d24d5d4529b74'),
    );
    if(response.statusCode==200)
    {
      setState(() {
        recipes = json.decode(response.body)['recipes'];
        isLoading = false;
      });
    }
    else
    {
      throw Exception('Failes to Load recipes');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('CookBook'),
        ),
        body: isLoading ?
        Center(child: CircularProgressIndicator()):
        ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index)
            {
              final recipe = recipes[index];
              return Card(
                child: ListTile(
                  leading:  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    child: Image.network(recipe['image']), ),
                  title: Text(recipe['title']),
                  subtitle: Text('Ready in ${recipe['readyInMinutes']} mins'),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipiDetail(recipe: recipe)));
                  },
                ),
              );
            })
    );
  }
}