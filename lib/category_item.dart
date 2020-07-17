import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget{
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);
  void selectCategory(BuildContext ctxt){
    Navigator.of(ctxt).push(MaterialPageRoute(builder :(_){
      return CategoryMealsScreen();
    },
    ),
    );
  }

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap:() => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child :Container(
      padding:const EdgeInsets.all(10),
      child:Text(title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            color.withOpacity(0.7),
            color,
            ],
            begin:Alignment.topLeft,
            end:Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      )
    ); 
  }
}
