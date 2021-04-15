import 'package:flutter/material.dart';
import 'package:real_estate_app/pages/login_page.dart';
import 'package:real_estate_app/pages/criteria_page.dart';
import 'package:real_estate_app/pages/calculator_page.dart';
import 'package:real_estate_app/pages/property_list_page.dart';

//var index = 0;

class TabNavigationPage extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigationPage> {
  int _selectedPage = 0;
  final _pageOptions = [
    LoginPage(),
    //CriteriaPage(),
    //CalculatorPage(),
    PropertyListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      body: Container(
        //color: Colors.white,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.7, 1],
            colors: [
              Colors.white,
              Colors.deepPurpleAccent,
            ],
          ),
        ),
      ),
      */
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedFontSize: 18.0,
        unselectedFontSize: 14.0,

        items: [
          BottomNavigationBarItem(
            label: 'Login',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Criteria',
            icon: Icon(Icons.assignment),
          ),
          BottomNavigationBarItem(
            label: 'Calculator',
            icon: Icon(Icons.post_add_rounded),
          ),

          BottomNavigationBarItem(
            label: 'Property List',
            icon: Icon(Icons.house),
          ),
        ],
      ),
    );
  }
}