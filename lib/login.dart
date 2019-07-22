import 'package:flutter/material.dart';
import 'package:components/authentication/sign_in.dart';
import 'package:components/main.dart';


void main() => runApp(new LoginPage());

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=> _LoginPageState();

}


class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new GoogleLogin(),
    );

  }

}


class GoogleLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (context)=> Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: new BoxDecoration(
                      image: DecorationImage(image: new AssetImage('images/login_e.jpg'), fit: BoxFit.cover)
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    MaterialButton(
                      padding: new EdgeInsets.all(10.0),
                      minWidth: 250.0,
                      onPressed: (){
                        SignInWithGooge().whenComplete((){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context){
                              return FirstScreen();
                            })
                          );
                        });
                      },
                      colorBrightness: Brightness.dark,
                      color: Colors.white,
                      elevation: 20.0,
                      highlightElevation: 1.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image(image: new AssetImage('icons/google.png'), height: 25, ),
                          SizedBox(width: 10.0,),
                          Text("Google Authentication", style: TextStyle(color: Colors.black87),)
                        ],

                      ),
                    ),
                    SizedBox(height: 10.0),
                    MaterialButton(
                      padding: new EdgeInsets.all(10.0),
                      minWidth: 250.0,
                      onPressed: (){print('Facebook');},
                      colorBrightness: Brightness.dark,
                      color: Colors.white,
                      elevation: 20.0,
                      highlightElevation: 1.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[
                          SizedBox(width: 15.0,),
                          Image(image: new AssetImage('icons/facebook.png'), height: 25,),
                          SizedBox(width: 10.0,),
                          Text("Facebook Authentication",style: TextStyle(color: Colors.black87),)
                        ],

                      ),
                    ),
                    SizedBox(height: 10.0,),
                    MaterialButton(
                      padding: new EdgeInsets.all(10.0),
                      minWidth: 250.0,
                      onPressed: (){print('Twitter');},
                      colorBrightness: Brightness.dark,
                      color: Colors.white,
                      elevation: 20.0,
                      highlightElevation: 1.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[
                          Image(image: new AssetImage('icons/twitter.png'), height: 25,),
                          SizedBox(width: 10.0,),
                          Text("Twitter Authentication", style: TextStyle(color: Colors.black87),)
                        ],

                      ),
                    ),
                  ],
                )
//
              ],
            )
        )
    );
  }

}

