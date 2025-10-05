import 'package:flutter/material.dart';
import 'package:meals/blueprint.dart';
class CategoryGridItem extends StatelessWidget
{
  const CategoryGridItem(this.cat, this.selectCategory, {super.key});
  final Category cat;
  final void Function() selectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration
        (
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [cat.color.withOpacity(0.55), cat.color.withOpacity(0.9)], begin: Alignment.topLeft, end:Alignment.bottomRight),
        ),
        child: Text(cat.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground) ,),
      ),
    );
  }
}