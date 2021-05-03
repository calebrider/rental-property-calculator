import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/pages/tab_navigation.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_app/shared/constants.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';



var lightBlueBackground = const Color(0xFFf5fdff);



class CriteriaPage extends StatefulWidget {
  @override
  _CriteriaPageState createState() => _CriteriaPageState();
}

class _CriteriaPageState extends State<CriteriaPage> {

  var cashFlowCriteriaController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
  var _cashFlowCriteria;
  double cashFlowCriteriaSliderValue = 0;

  var cashOnCashCriteriaController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', rightSymbol: '%');
  var _cashOnCashCriteria;
  double cashOnCashCriteriaSliderValue = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //prevents gradient from sliding up with keyboard
      //backgroundColor: lightBlueBackground,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Criteria',
          style: TextStyle(
            fontFamily: 'Quicksand',
            //fontWeight: FontWeight.bold,
            fontSize: 24.0,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
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
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Enter your property criteria below:',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20.0,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text('Minimum Cash Flow/Unit',
                style: inputLabelStyle,
              ),
            ),
            Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              style: neumorphicTextFieldStyle,
              child: TextField(
                  style: textInputStyle,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: cashFlowCriteriaController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: textInputDecoration
              ),
            ),
            Slider(
              value: cashFlowCriteriaSliderValue,
              min: 0,
              max: 1000,
              divisions: 100,
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.grey[600],
              //label: downPaymentSliderValue.round().toString(),

              //onChanged: (downPaymentSliderValue) => setState(() => this.downPaymentSliderValue = downPaymentSliderValue),
              //onChangeEnd: (downPaymentSliderValue) => setState(() => downPaymentController.text = downPaymentSliderValue.toString()),
              onChanged: (double purchasePriceSliderValue) {
                setState(() {
                  this.cashFlowCriteriaSliderValue = purchasePriceSliderValue;
                  cashFlowCriteriaController.text = (purchasePriceSliderValue*10).toString();
                });
              },

            ),
            Padding(padding: EdgeInsets.all(20.0)),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text('Minimum Cash on Cash Return',
                style: inputLabelStyle,
              ),
            ),
            Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              style: neumorphicTextFieldStyle,
              child: TextField(
                  style: textInputStyle,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: cashOnCashCriteriaController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: textInputDecoration
              ),
            ),
            Slider(
              value: cashOnCashCriteriaSliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.grey[600],
              //label: downPaymentSliderValue.round().toString(),

              //onChanged: (downPaymentSliderValue) => setState(() => this.downPaymentSliderValue = downPaymentSliderValue),
              //onChangeEnd: (downPaymentSliderValue) => setState(() => downPaymentController.text = downPaymentSliderValue.toString()),
              onChanged: (double purchasePriceSliderValue) {
                setState(() {
                  this.cashOnCashCriteriaSliderValue = purchasePriceSliderValue;
                  cashOnCashCriteriaController.text = (purchasePriceSliderValue*10).toString();
                });
              },

            ),
            Padding(padding: EdgeInsets.all(20.0)),
          ],
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