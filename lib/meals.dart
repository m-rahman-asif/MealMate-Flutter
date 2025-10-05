import 'package:meals/blueprint.dart';
import 'package:flutter/material.dart';
import 'package:meals/meal_details.dart';
import 'package:meals/meal_item.dart';
class MealsScreen extends StatelessWidget
{
  const MealsScreen(this.meals, this.onToggle, {this.title, super.key});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggle;
  void ShowMealDetail(BuildContext context, Meal meal)
  {
    Navigator.push(context,  MaterialPageRoute(builder: (context){
      return MealDetails(meal, onToggle);}));
  }
  @override
  Widget build(BuildContext context) {
    Widget cnt=ListView.builder(itemCount: meals.length,itemBuilder: (context, index) => MealItem(meals[index],(){ ShowMealDetail(context, meals[index]);}));
   
    if(meals.isEmpty==true)
    {
        cnt=Center(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Oops! No meals been found.", style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            SizedBox(height: 16,),
            Text("Select a different category.", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),

          ],
        ));
    }
    if(title==null)
    {
      return cnt;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: cnt   
    );

  }
}