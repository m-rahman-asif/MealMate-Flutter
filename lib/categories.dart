import 'package:flutter/material.dart';
import 'package:meals/blueprint.dart';
import 'package:meals/category_grid_item.dart';
import 'package:meals/meals.dart';
class CategoriesScreen extends StatelessWidget
{
  const CategoriesScreen(this.onToggle, this.filtered, {super.key});
  final void Function(Meal meal) onToggle;
  final List<Meal> filtered;
  void selectCategory(BuildContext context, Category cat)
  {
    List<Meal> meals=[];
    for(int i=0; i<filtered.length; i++)
    {
      for(int j=0; j<filtered[i].categories.length; j++)
      {
        if(filtered[i].categories[j]==cat.id)
        {
          meals.add(filtered[i]);
          break;
        }
      }
    }
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return MealsScreen(meals, onToggle, title: cat.title);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        children: [
          for(int i=0; i<availableCategories.length; i++)         
            CategoryGridItem(availableCategories[i], (){selectCategory(context, availableCategories[i]);})
          
        ],
      ),
    );
  }
}