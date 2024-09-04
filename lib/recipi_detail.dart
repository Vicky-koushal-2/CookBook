
import 'package:flutter/material.dart';

class RecipiDetail extends StatelessWidget {
  final Map recipe;
  const RecipiDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']),
      ),
        body: Padding(padding:
    EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(recipe['image']),
              SizedBox(height: 16,),
              Text('Ingredients:',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              ),
              ...recipe['extendedIngredients']
              .map<Widget>((ingredient)=>Text('-${ingredient['original']}'))
              .toList(),
              Text('Instructions:',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 18,
              ),)
            ],
          ),
    ),

    );
  }
}
