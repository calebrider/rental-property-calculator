import 'package:flutter/material.dart';
import 'package:real_estate_app/pages/tab_navigation.dart';

var lightBlueBackground = const Color(0xFFf5fdff);



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //prevents gradient from sliding up with keyboard
      body: Container(
        //color: Colors.white,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.9, 1],
            colors: [
              Colors.lightBlueAccent,
              lightBlueBackground,
              //lightGreenColor,
              Colors.white,
            ],
          ),
        ),
        child: Column(children: <Widget>[
          //Scaffold(
          //body: Image.asset('assets/images/Plane_Logo_Colored.png', height: 50, width: 50,),
          //),
          Padding(padding: EdgeInsets.all(20.0)),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: new AssetImage('assets/images/Plane_Logo_Colored.png'),
              // ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20.0, // has the effect of softening the shadow
                  spreadRadius: 0.0, // has the effect of extending the shadow
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    5.0, // vertical, move down 10
                  ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          Text("Real Estate Calculator Login.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
          /*
        Center(
          child: Container(
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.4, 1],
                colors: [
                  Colors.greenAccent[100],
                  Colors.greenAccent[200]
                ],
              ),
              //color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: new Text("HI MOM", style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold, ),),
          padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
          ),
        ),
        */
          Padding(padding: EdgeInsets.all(10.0)),
          TextField(
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
              hintText: "email",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2
                  )
              ),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.person),
                ),
                padding: EdgeInsets.all(20.0),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0),),
          TextField(
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
              hintText: "password",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: BorderSide(
                    color: Colors.white,
                    width: 2
                ),
              ),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.lock),
                ),
                padding: EdgeInsets.all(20.0),
              ),
            ),
          ),
          Column(children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: TextButton(
                child: Text("Forgot Password?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TabNavigationPage()));
                },
              ),
            ),
            Container(
              child: TextButton(
                child: Text("Don't Have an Account?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),),
              ),
            ),
          ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          new RaisedButton(
            elevation: 10,
            padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            child: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(40.0),
                side: BorderSide(color: Colors.white)
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabNavigationPage())
              );
            },
          ),
          /*
        new RaisedButton(
          elevation: 5,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          color: Colors.white,
          textColor: Colors.green,
          child: Text("Sign Up", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0),
              side: BorderSide(color: Colors.green)
          ),
          onPressed: () {},
        ),
        */
        ],
        ),
        padding: EdgeInsets.all(30.0),
      ),
    );
  }
}
