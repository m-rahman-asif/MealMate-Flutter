import 'package:flutter/material.dart';
import 'package:meals/blueprint.dart';
import 'package:meals/categories.dart';
import 'package:meals/filters.dart';
import 'package:meals/main_drawer.dart';
import 'package:meals/meals.dart';
class TabsScreen extends StatefulWidget
{
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen>
{
  int ind=0;
  String title="Categories";
  List<Meal> favMeals=[];
  Map<Filter, bool> selfilters={
    Filter.glutenfree:false,
    Filter.lactosefree:false,
    Filter.vegetarian:false,
    Filter.vegan:false,
  };
  void addToFavs(Meal meal)
  {
    int f=0;
    for(int i=0; i<favMeals.length; i++)
    {
      if(meal.id==favMeals[i].id)
      {
        f=1;
        break;
      }
    }
    if(f==0)
    {
      setState(() {
        favMeals.add(meal);
      });
      showMessage("Added to favourites");
      
    }
    else if(f==1)
    {
      setState(() {
        favMeals.remove(meal);
      });
      showMessage("Removed from favourites");
      
    }
  }
  void showMessage(String txt)
  {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3), content: Text(txt)));
  }


  void setScreen(String idn)
  async
  {
      if(idn=="filters")
      {
        Navigator.of(context).pop();
       var result= await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (context)=>FiltersScreen(selfilters)));
       setState(() {
         selfilters=result??selfilters;
       });
       
      }
      else
      {
        Navigator.of(context).pop();
      }
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> availmeals=[];
    for(int i=0; i<dummyMeals.length; i++)
    {
      if(  (selfilters[Filter.glutenfree]==false || (selfilters[Filter.glutenfree]==true && dummyMeals[i].isGlutenFree==true)) && (selfilters[Filter.lactosefree]==false || (selfilters[Filter.lactosefree]==true && dummyMeals[i].isLactoseFree==true)) && (selfilters[Filter.vegetarian]==false || (selfilters[Filter.vegetarian]==true && dummyMeals[i].isVegetarian==true)) && (selfilters[Filter.vegan]==false || (selfilters[Filter.vegan]==true && dummyMeals[i].isVegan==true))  )
      {
        availmeals.add(dummyMeals[i]);
      }
    }
    
    Widget active=CategoriesScreen(addToFavs, availmeals);
    if (ind==1)
    {
      active=MealsScreen(favMeals, addToFavs );
      title="My Favourites";
    }
    else if (ind==0)
    {
      title="Categories";
    }
    return Scaffold(
      drawer: MainDrawer(setScreen),
      appBar: AppBar(
        title: Text(title)
      ),
      body:active,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ind,
        onTap: (index){
          setState(() {
            ind=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ]
      ),
    );
  }
}