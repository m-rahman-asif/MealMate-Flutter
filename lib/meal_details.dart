import 'package:flutter/material.dart';
import 'package:meals/blueprint.dart';
class MealDetails extends StatelessWidget
{
  const MealDetails(this.meal,this. onToggle, {super.key});
  final Meal meal;
  final void Function(Meal meal) onToggle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),actions: [IconButton(onPressed: (){onToggle(meal);}, icon: Icon(Icons.star))],),
      body: Column(
        children: [
          Image.network(meal.imageUrl, height: 300, width: double.infinity,fit: BoxFit.cover,),
          SizedBox(height: 15,),
          Expanded(child: SingleChildScrollView(
            child: Column(children: [
                Text("Ingredients: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
          SizedBox(height: 8,),
          for(int i=0; i<meal.ingredients.length; i++)
            Text(meal.ingredients[i], style: TextStyle(color: Colors.white),),
            SizedBox(height: 15,),
          Text("Steps:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
          SizedBox(height: 8,),
          for(int i=0; i<meal.steps.length; i++)
            Align(
    alignment: Alignment.centerLeft,
    child: Text("$i. ${meal.steps[i]}",
      style: TextStyle(color: Colors.white),
    ),
  )
            ],),
          ))
          
        ],
      )
    );
  }
}