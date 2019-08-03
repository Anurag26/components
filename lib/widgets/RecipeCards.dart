import 'package:flutter/material.dart';
import 'package:components/widgets/FoodDesc.dart';


class RecipeItem extends StatelessWidget{
final leftImageSec= new  ClipRRect(
borderRadius: new BorderRadius.circular(8.0),
  child: Align(
     alignment: Alignment.center,
     heightFactor: 1,
     child: Image.network('https://imgur.com/aPGv6RA.jpg'),
),
);
  final middleFoodMeta=new Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FoodDescription()
      ],
    ),
  );


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SizedBox(
      height: MediaQuery.of(context).size.height*0.15,
      width: MediaQuery.of(context).size.width,
      child:  Card(
        elevation: 0,
          child: Row(
            children: <Widget>[
          new  ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
        child: Align(
          alignment: Alignment.center,
          heightFactor: 1,
          child: Image.network('https://imgur.com/aPGv6RA.jpg'),
        ),
      ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 5,top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  new Container(
                  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    FoodDescription()
    ],
    ),
    ),
//                rightFavFood
                  ],
                ),
              )
            ],
          )
      )


    );

  }




}