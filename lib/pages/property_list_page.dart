import 'package:flutter/material.dart';


class PropertyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //prevents gradient from sliding up with keyboard
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        //color: Colors.white,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 1],
            colors: [
              Colors.white,
              Colors.blueGrey,
            ],
          ),
        ),
      ),
    );
  }
}
/*
//var index = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pageOptions = [
    //HomePage(),
    SearchPage(),
    MessagePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        backgroundColor: Colors.green,
      ),
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
        /*
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {_currentIndex = index;});
          print(_currentIndex);
          if(_currentIndex==3){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));};
        },
        */
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          /*
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: Colors.green,),
            title: new Text("Home", style: TextStyle(color: Colors.green),),
          ),
          */
          BottomNavigationBarItem(
            icon: new Icon(Icons.search, color: Colors.green,),
            title: new Text("Search", style: TextStyle(color: Colors.green),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail, color: Colors.green,),
            title: new Text("Messages", style: TextStyle(color: Colors.green),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person, color: Colors.green,),
            title: new Text("Profile", style: TextStyle(color: Colors.green),),
          ),
        ],
      ),
    );
  }
}
 */