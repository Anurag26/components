import 'package:flutter/material.dart';
import 'package:components/widgets/RecipeCards.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:components/models/recipeListModel.dart';
import 'package:components/NetworkUtils/getMainListInformation.dart';

class Recipe extends StatefulWidget{
  @override
  RecipesList createState()=> RecipesList();
}

class RecipesList extends State<Recipe>{
  final color = const Color(0xffbfd6ba);
  final color_text = const Color(0xffd1bad6);
  final databaseReference = FirebaseDatabase.instance.reference();
  final makecall= new MakeCall();


  @override
  Widget build(BuildContext context) {

    var futureBuilder=new FutureBuilder(
      future: makecall.firebaseCalls(databaseReference), // async work
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none: return new Text('Press button to start');
          case ConnectionState.waiting: return new Text('Loading....');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
                return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
//                  return new Text(snapshot.data[index].foodtitle);
                   return Card(
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child:  SizedBox(
                height: MediaQuery.of(context).size.height*0.15,
                       width: MediaQuery.of(context).size.width,
                       child:  Card(
                           elevation: 0,
                           child: Row(
                             children: <Widget>[
                               new Container(
//
                                     child: Image.network(snapshot.data[index].iconUrl,height: MediaQuery.of(context).size.width*0.3,width: MediaQuery.of(context).size.width*0.3,),


//                                 ),
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
                                           Column(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text(snapshot.data[index].foodtitle, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,fontFamily: 'Roboto-Black'),),
                                               SizedBox(height:10.0),
                                               Row(
                                                 children: <Widget>[
                                                   new IconTheme(
                                                     data: new IconThemeData(
                                                         color: Colors.black26),
                                                     child: new Icon(Icons.timer,size: 20.0,),
                                                   ),
                                                   Text('${snapshot.data[index].PreptimeInMins} minutes',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black26),)
                                                 ],
                                               )

                                             ],
                                           )
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


                   ),
                ),
              );
                },
                );
        }
      },
    );

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: color,
        centerTitle: true,
//        title: Text('Browsing', style: TextStyle(fontFamily: 'Roboto-Black',fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),),
          title : new Image.asset('images/cooking.png'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu), color: Colors.black26,onPressed: (){print('Menu pressed');},)
        ],
        elevation: 0.0,
      ),

      body: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(top: 5.0,bottom: 10),
         color: color,
         child: new Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             ButtonTheme(
               minWidth: MediaQuery.of(context).size.width*0.4,
               height: MediaQuery.of(context).size.height*0.06,
               child:MaterialButton(
                 onPressed: (){

                   //                 MakeCall makecall= new MakeCall();
//                 var response=makecall.firebaseCalls(databaseReference);
//                 print(makecall.listItems[0].foodtitle);
//                 print(makecall.listItems[1].foodtitle);
//                   new ListView.builder(
//                    itemCount: makecall.listItems.length,
//                     itemBuilder: (BuildContext context, int index){
//                      return
//                     },
//                   );
                   },
                 color: Colors.white,
//               disabledTextColor: Colors.grey,
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0), right: Radius.circular(1.0))
               ),
//                 elevation: 15.0,
                 splashColor: color,
                 highlightColor:color,
//                 highlightElevation: 1.0,
                 child: Text("Cook Book",style: TextStyle(fontFamily: 'Roboto-Thin ',color: Colors.black26,fontSize: 15),),
               ) ,
             ),

             ButtonTheme(
               minWidth: MediaQuery.of(context).size.width*0.4,
               height: MediaQuery.of(context).size.height*0.06,
               buttonColor: Colors.amberAccent,
               child:MaterialButton(
                 onPressed: (){Scaffold.of(context).showSnackBar(SnackBar(content: Text('Hey There')));},
                 color: Colors.white,
//               disabledTextColor: Colors.grey,
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0), left: Radius.circular(1.0))
               ),
//                 elevation: 15.0,

                 highlightColor:color,
//                 highlightElevation: 1.0,
                 child: Text("Favourite",style: TextStyle(fontFamily: 'Roboto-Thin ',color: Colors.black26,fontSize: 15)),
               ) ,
             ),
           ],
         ),
          ),
          SizedBox(height: 0),
          new Expanded(
//        
            child:Container(
              child: futureBuilder,
            ) ,
//
          ),

        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: color,
        elevation: 20.0,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home,color: Colors.white,),
            title: new Text('Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_circle,color: Colors.white,),
            title: new Text('Add a Recipe',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700))
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.collections,color: Colors.white,),
            title: new Text('My recipes',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
          )
        ],
      ),
    );

  }
}