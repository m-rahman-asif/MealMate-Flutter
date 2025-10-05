import 'package:flutter/material.dart';
import 'package:meals/blueprint.dart';
import 'package:transparent_image/transparent_image.dart';
class MealItem extends StatelessWidget
{
  const MealItem(this.meal, this.showDetail, {super.key});
  final Meal meal;
  final void Function() showDetail;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: showDetail,
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl), fit: BoxFit.cover, height: 300, width: double.infinity),
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: Container(
                color: Colors.black54,
                 padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(meal.title, maxLines: 2, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center, softWrap: true, overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                           Icon(Icons.schedule, size: 17, color: Colors.white,),
                           SizedBox(width: 6,),
                           Text("${meal.duration} min", style: TextStyle(color: Colors.white),),
                           SizedBox(width: 12,),
                           
                           Icon(Icons.work, size: 17, color: Colors.white,),
                           SizedBox(width: 6,),
                           Text("${meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1)}", style: TextStyle(color: Colors.white),),

                           SizedBox(width: 6,),
                           Icon(Icons.attach_money, size: 17, color: Colors.white,),
                           SizedBox(width: 6,),
                           Text("${meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1)}", style: TextStyle(color: Colors.white),),
                           
                      ],
                    )
                  ],
                ),
              ))
          ],
        )
      ),
    );
  }
}