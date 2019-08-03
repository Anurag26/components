import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';


class RecipeList{
  List<RecipeDetailListItem> recipeList;

  RecipeList({this.recipeList});

  factory RecipeList.fromJSON(Map<dynamic,dynamic> json){
    return RecipeList(
      recipeList: parserecipes(json)
    );
  }

  static List<RecipeDetailListItem> parserecipes(recipeJSON){
    var rList=recipeJSON['browseRecipes'] as List;
    List<RecipeDetailListItem> recipeList=rList.map((data) => RecipeDetailListItem.fromJson(data)).toList();
    return recipeList;
  }
}


class RecipeDetailListItem {
  String foodtitle;
  String iconUrl;
  String PreptimeInMins;
  String uid;
  String vegOrNon;

  RecipeDetailListItem({this.foodtitle,this.iconUrl,this.PreptimeInMins,this.uid,this.vegOrNon});




  factory RecipeDetailListItem.fromJson(Map<dynamic,dynamic> parsedJson) {
//    print(parsedJson);
    return RecipeDetailListItem(foodtitle:parsedJson['Name'],iconUrl: parsedJson['icon'],PreptimeInMins:parsedJson['PreptimeInMins'],uid: parsedJson['uid'],vegOrNon:parsedJson['vegOrNon']);
  }




}





