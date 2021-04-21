import 'dart:async';

import 'package:flutter/material.dart';
import 'package:real_estate_app/pages/tab_navigation.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:real_estate_app/shared/constants.dart';


var lightBlueBackground = const Color(0xFFf5fdff);
var _buttonColor = Colors.lightBlueAccent;
double _imageWidth = 0;
double _imageHeight = 0;
double _loginCredentialHeight = 0;

Timer _timer;


class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {

    if (mounted)
    Future.delayed(Duration(seconds: 1)).then((value) =>
        setState(() {
          _imageWidth = 150;
          _imageHeight = 150;
          _loginCredentialHeight = 200;
        }));



    void _schedule() {
      _timer = Timer(Duration(seconds: 2), () {
        print('Do something after delay');
      });
    }

    @override
    void dispose() {
      super.dispose();
      _timer?.cancel();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false, //prevents gradient from sliding up with keyboard
      body: SizedBox.expand(
        child: Container(
          //color: Colors.white,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.95, 1],
              colors: [
                Colors.lightBlueAccent,
                lightBlueBackground,
                //lightGreenColor,
                Colors.white,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              //Scaffold(
              //body: Image.asset('assets/images/Plane_Logo_Colored.png', height: 50, width: 50,),
              //),
              Padding(padding: EdgeInsets.all(20.0)),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                width: _imageWidth,
                height: _imageHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  // image: DecorationImage(
                  //   //fit: BoxFit.fill,
                  //   image: new AssetImage('assets/real_estate_app_logo.png'),
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
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Image(image: AssetImage('assets/real_estate_app_logo.png'),),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text("Real Estate Calculator",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20.0,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
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
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                height: _loginCredentialHeight,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Neumorphic(
                        style: neumorphicTextFieldStyle,
                        child: Theme(
                          child: TextField(
                            style: inputLabelStyle,
                                decoration: textInputDecoration.copyWith(prefixIcon: Icon(Icons.person)).copyWith(hintText: "Email").copyWith(hintStyle: TextStyle(color: Colors.grey[400])),
                            ),
                          data: ThemeData(primaryColor: Colors.lightBlueAccent),
                        ),
                        ),
                      Padding(padding: EdgeInsets.all(10.0),),
                      Neumorphic(
                        style: neumorphicTextFieldStyle,
                        child: Theme(
                          child: TextField(
                            obscureText: true,
                            style: inputLabelStyle,
                            decoration: textInputDecoration.copyWith(prefixIcon: Icon(Icons.lock)).copyWith(hintText: "Password").copyWith(hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                          data: ThemeData(primaryColor: Colors.lightBlueAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: TextButton(
                    child: Text("Forgot Password?",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 15.0,
                        letterSpacing: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TabNavigationPage()));
                    },
                  ),
                ),
                Container(
                  child: TextButton(
                    child: Text("Don't Have an Account?",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 15.0,
                        letterSpacing: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(40.0, 2.0, 40.0, 2.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                    backgroundColor: MaterialStateProperty.all(_buttonColor),
                    elevation: MaterialStateProperty.all(5.0),
                  ),
                child: Text("Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    letterSpacing: 2.0,
                    fontSize: 26.0,

                  ),
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
          ),
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
        ),
      ),
    );
  }
}
