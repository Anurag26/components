import 'package:flutter/material.dart';


class FoodDescription extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Meat Burger', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,fontFamily: 'Roboto-Black'),),
        SizedBox(height:10.0),
        Row(
          children: <Widget>[
            new IconTheme(
              data: new IconThemeData(
                  color: Colors.black26),
              child: new Icon(Icons.timer,size: 20.0,),
            ),
            Text('15 minutes',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black26),)
          ],
        )
        
      ],
    );
  }
  
}