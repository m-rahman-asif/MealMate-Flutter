import 'package:flutter/material.dart';
import 'package:meals/main_drawer.dart';
class FiltersScreen extends StatefulWidget
{
  const FiltersScreen (this.currentFilter, {super.key});
  final Map<Filter, bool> currentFilter;
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

enum Filter {
  glutenfree, lactosefree, vegetarian, vegan
}

class _FiltersScreenState extends State<FiltersScreen>
{
  
  bool glutenFreeFilterSet=false;
  bool lactoseFreeFilterSet=false;
  bool vegeterianFilterSet=false;
  bool veganFilterSet=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    glutenFreeFilterSet=widget.currentFilter[Filter.glutenfree]!;
    lactoseFreeFilterSet=widget.currentFilter[Filter.lactosefree]!;
    vegeterianFilterSet=widget.currentFilter[Filter.vegetarian]!;
    veganFilterSet=widget.currentFilter[Filter.vegan]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // drawer: MainDrawer(onSelectScreen:),
      appBar: AppBar(
        title: Text("My Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(
            {
              Filter.glutenfree:glutenFreeFilterSet,
              Filter.lactosefree:lactoseFreeFilterSet,
              Filter.vegetarian:vegeterianFilterSet,
              Filter.vegan:veganFilterSet
            }
            
          );
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(value: glutenFreeFilterSet, onChanged: (isChecked){
              setState(() {
                glutenFreeFilterSet=isChecked;
              });
            }, 
            title: Text("Gluten-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            subtitle: Text("Only includes gluten-free meals", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(value: lactoseFreeFilterSet, onChanged: (isChecked){
              setState(() {
                lactoseFreeFilterSet=isChecked;
              });
            }, 
            title: Text("Lactose-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            subtitle: Text("Only includes lactose-free meals", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(value: vegeterianFilterSet, onChanged: (isChecked){
              setState(() {
                vegeterianFilterSet=isChecked;
              });
            }, 
            title: Text("Vegeterian", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            subtitle: Text("Only includes vegeterian meals", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(value: veganFilterSet, onChanged: (isChecked){
              setState(() {
                veganFilterSet=isChecked;
              });
            }, 
            title: Text("Vegan", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            subtitle: Text("Only includes vegan meals", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
        )
        ], 
        ),
      ),
    );
  }
}