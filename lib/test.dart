import 'package:flutter/material.dart';
import 'package:components/NetworkUtils/getMainListInformation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:components/models/recipeListModel.dart';

void main() => runApp(new test());

class test extends StatelessWidget{
  static MakeCall makeCall = new MakeCall();
  static final  databaseReference = FirebaseDatabase.instance.reference();


  @override
  Widget build(BuildContext context) {
    var futureBuilder=new FutureBuilder(
      future: makeCall.firebaseCalls(databaseReference), // async work
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none: return new Text('Press button to start');
          case ConnectionState.waiting: return new Text('Loading....');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return new Text('Result: ${snapshot.data[1].foodtitle}');
        }
      },
    );
    return MaterialApp(
     home: new Scaffold(
       appBar: AppBar(
         title: Text('Testing Future Builder'),
       ),
       body: futureBuilder
     )
   );
  }
}