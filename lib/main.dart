import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_app/shared/constants.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


void main() => runApp(MaterialApp(
  home: Home(),
));


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var lightBlueBackground = const Color(0xFFf5fdff);

  var _loanTerm;
  String _loanTermVal;
  List _loanTermList = ['15', '20', '30'];

  var _pMI;
  var _monthlyPayment;

  var purchasePriceController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
  var _purchasePrice;
  double purchasePriceSliderValue = 0;

  var downPaymentController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', rightSymbol: '%');
  var _downPayment;
  var _downPaymentTotal;
  var _totalPayments;
  double downPaymentSliderValue = 0;


  var interestRateController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', rightSymbol: '%');
  var _interestRate;
  var _monthlyInterest;
  double interestRateSliderValue = 0;

  var closingCostsController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
  var _closingCosts;

  var mortgageController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
  var _mortgage;

  var insuranceController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
  var _insurance;

  var propertyTaxesController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
  var _propertyTaxes;

  var repairsController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
  var _repairs;

  var monthlyRentController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
  var _monthlyRent;

  var capitalExpenditureController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
  var _capitalExpenditure;

  var vacancyController = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', rightSymbol: '%');
  var _vacancy;


  var _cashFlow = 0.0;
  var _cashOnCashReturn = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: lightBlueBackground,
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Real Estate Calculator',
            style: TextStyle(
              fontFamily: 'Quicksand',
              //fontWeight: FontWeight.bold,
              fontSize: 30.0,
              letterSpacing: 2.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Enter your property values below:',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20.0,
                      letterSpacing: 1.5,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.lightBlueAccent,
                thickness: 1.0,
              ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SliderTheme(
                      data: SliderThemeData(
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('Purchase Price',
                              style: inputLabelStyle,
                            ),
                          ),
                          Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                            style: neumorphicTextFieldStyle,
                            child: TextField(
                                style: textInputStyle,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                controller: purchasePriceController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: textInputDecoration
                            ),
                          ),
                          Slider(
                            value: purchasePriceSliderValue,
                            min: 0,
                            max: 1000000,
                            divisions: 100,
                            activeColor: Colors.lightBlueAccent,
                            inactiveColor: Colors.grey[300],
                            //label: downPaymentSliderValue.round().toString(),

                            //onChanged: (downPaymentSliderValue) => setState(() => this.downPaymentSliderValue = downPaymentSliderValue),
                            //onChangeEnd: (downPaymentSliderValue) => setState(() => downPaymentController.text = downPaymentSliderValue.toString()),
                            onChanged: (double purchasePriceSliderValue) {
                              setState(() {
                                this.purchasePriceSliderValue = purchasePriceSliderValue;
                                purchasePriceController.text = (purchasePriceSliderValue*10).toString();
                              });
                            },

                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('Down Payment',
                              style: inputLabelStyle,
                            ),
                          ),
                          Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                            style: neumorphicTextFieldStyle,
                            child: TextField(
                              style: textInputStyle,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.bottom,
                              controller: downPaymentController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: textInputDecoration
                            ),
                          ),
                        Slider(
                            value: downPaymentSliderValue,
                            min: 0,
                            max: 100,
                            divisions: 100,
                            activeColor: Colors.lightBlueAccent,
                            inactiveColor: Colors.grey[300],
                            //label: downPaymentSliderValue.round().toString(),

                            //onChanged: (downPaymentSliderValue) => setState(() => this.downPaymentSliderValue = downPaymentSliderValue),
                            //onChangeEnd: (downPaymentSliderValue) => setState(() => downPaymentController.text = downPaymentSliderValue.toString()),
                            onChanged: (double downPaymentSliderValue) {
                              setState(() {
                                this.downPaymentSliderValue = downPaymentSliderValue;
                                downPaymentController.text = (downPaymentSliderValue*10).toString();
                              });
                            },
                        ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Loan Term',
                                          style: inputLabelStyle,
                                        ),
                                      Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                                          style: neumorphicDropdownButtonStyle,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(30.0, 3, 30.0, 3),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                  dropdownColor: Colors.lightBlueAccent,
                                                  elevation: 5,
                                                  hint: Text(
                                                    'Yrs',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Quicksand',
                                                      fontSize: 22.0,
                                                      letterSpacing: 2.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  icon: Icon(Icons.arrow_drop_down_rounded, color: Colors.white, size: 30.0,),
                                                  value: _loanTermVal,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _loanTermVal = value;
                                                    });
                                                  },
                                                  items: _loanTermList.map((value) {
                                                    return DropdownMenuItem(
                                                      value: value,
                                                      child: Text(
                                                          value,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: 'Quicksand',
                                                            letterSpacing: 2.0,
                                                            fontSize: 22.0,
                                                          ),
                                                      ),

                                                    );
                                                  }).toList()
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              Padding(padding: EdgeInsets.all(10.0)),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                                        alignment: Alignment.bottomCenter,
                                        child: Text('Interest Rate',
                                          style: inputLabelStyle,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Neumorphic(
                                            style: neumorphicTextFieldStyle,
                                            child: TextField(
                                                style: textInputStyle,
                                                textAlign: TextAlign.center,
                                                textAlignVertical: TextAlignVertical.bottom,
                                                controller: interestRateController,
                                                keyboardType: TextInputType.number,
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter.digitsOnly
                                                ],
                                                decoration: textInputDecoration
                                            ),
                                          ),
                                          Slider(
                                            value: interestRateSliderValue,
                                            min: 0,
                                            max: 5,
                                            divisions: 100,
                                            activeColor: Colors.lightBlueAccent,
                                            inactiveColor: Colors.grey[300],
                                            //label: downPaymentSliderValue.round().toString(),

                                            //onChanged: (downPaymentSliderValue) => setState(() => this.downPaymentSliderValue = downPaymentSliderValue),
                                            //onChangeEnd: (downPaymentSliderValue) => setState(() => downPaymentController.text = downPaymentSliderValue.toString()),
                                            onChanged: (double interestRateSliderValue) {
                                              setState(() {
                                                this.interestRateSliderValue = interestRateSliderValue;
                                                interestRateController.text = (interestRateSliderValue*10).toString();
                                              });
                                            },

                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text('Closing Costs',
                            style: inputLabelStyle,
                          ),
                        ),
                        Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                          style: neumorphicTextFieldStyle,
                          child: TextField(
                            style: textInputStyle,
                            textAlign: TextAlign.center,
                            controller: closingCostsController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: textInputDecoration
                          ),
                        ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('Repairs',
                              style: inputLabelStyle,
                            ),
                          ),
                          Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                            style: neumorphicTextFieldStyle,
                            child: TextField(
                                style: textInputStyle,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                controller: repairsController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: textInputDecoration
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('Property Taxes',
                              style: inputLabelStyle,
                            ),
                          ),
                          Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                            style: neumorphicTextFieldStyle,
                            child: TextField(
                                style: textInputStyle,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                controller: propertyTaxesController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: textInputDecoration
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('Insurance',
                              style: inputLabelStyle,
                            ),
                          ),
                          Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                            style: neumorphicTextFieldStyle,
                            child: TextField(
                                style: textInputStyle,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                controller: insuranceController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: textInputDecoration
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('Capital Expenditure',
                              style: inputLabelStyle,
                            ),
                          ),
                          Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                            style: neumorphicTextFieldStyle,
                            child: TextField(
                                style: textInputStyle,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                controller: capitalExpenditureController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: textInputDecoration
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('Vacancy',
                              style: inputLabelStyle,
                            ),
                          ),
                          Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            style: neumorphicTextFieldStyle,
                            child: TextField(
                                style: textInputStyle,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                controller: vacancyController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: textInputDecoration
                            ),
                          ),

                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text('Monthly Rent',
                            style: inputLabelStyle,
                          ),
                        ),
                        Neumorphic(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                          style: neumorphicTextFieldStyle,
                          child: TextField(
                            style: textInputStyle,
                            textAlign: TextAlign.center,
                            controller: monthlyRentController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: textInputDecoration
                          ),
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
              Container(
                child: Neumorphic(
                  style: neumorphicDisplayStyle,
                  child: Container(margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                      //border: Border(top: BorderSide(color: Colors.lightBlueAccent, width: 4.0)),
                    ),

                    child: Column(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(40.0, 2.0, 40.0, 2.0)),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                                  backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                                  elevation: MaterialStateProperty.all(5.0),
                                ),
                                onPressed: () {
                                  setState(() {

                                    _purchasePrice = double.parse(
                                        purchasePriceController.text.replaceAll(',', '')
                                            .replaceAll('\$', ''));
                                    print('_purchasePrice: ');
                                    print(_purchasePrice);

                                    _downPayment = double.parse(
                                        downPaymentController.text.replaceAll(',', '')
                                            .replaceAll('%', ''));
                                    print('_downPayment: ');
                                    print(_downPayment);

                                    if (_loanTermVal != null) {
                                      _loanTerm = double.parse(
                                          _loanTermVal
                                      );
                                    }
                                    else {
                                      _loanTerm = 1;
                                    }
                                    print('laon term');
                                    print(_loanTerm);

                                      _totalPayments = _loanTerm * 12;

                                    print('_totalPayments');
                                    print(_totalPayments);


                                    _interestRate = double.parse(
                                        interestRateController.text.replaceAll(',', '')
                                            .replaceAll('%', ''));
                                    print('_interestRate: ');
                                    print(_interestRate);

                                    // Calculate Mortgage Payment
                                    //Monthly Payments = L[c(1 + c)^n]/[(1 + c)^n - 1]
                                    _downPaymentTotal = _purchasePrice*(_downPayment/100);
                                    _monthlyInterest = _interestRate/100/12;


                                    _mortgage = (_purchasePrice - _downPaymentTotal)*(_monthlyInterest*pow(1+_monthlyInterest, _totalPayments))/(pow((1+_monthlyInterest), _totalPayments)-1);

                                    //print(_mortgage);
                                    //print(_monthlyInterest);
                                    print('_mortgage');
                                    print(_mortgage);

                                    _closingCosts = double.parse(
                                        closingCostsController.text.replaceAll(',', '')
                                            .replaceAll('\$', ''));

                                    _repairs = double.parse(
                                        repairsController.text.replaceAll(',', '')
                                            .replaceAll('\$', ''));

                                    _propertyTaxes = double.parse(
                                        propertyTaxesController.text.replaceAll(',', '')
                                            .replaceAll('\$', ''));

                                    _insurance = double.parse(
                                        insuranceController.text.replaceAll(',', '')
                                            .replaceAll('\$', ''));

                                    _capitalExpenditure = double.parse(
                                        capitalExpenditureController.text.replaceAll(',', '')
                                            .replaceAll('\$', ''));

                                    _monthlyRent = double.parse(
                                        monthlyRentController.text.replaceAll(',', '')
                                            .replaceAll('\$', ''));

                                    _vacancy = double.parse(
                                        vacancyController.text.replaceAll(',', '')
                                            .replaceAll('%', ''));
                                    _vacancy = _vacancy/100;
                                    print('vacacny');
                                    print(_vacancy);

                                    if (_downPayment < 20) {
                                      _pMI = (_purchasePrice - _downPaymentTotal)*.01/12;
                                    }
                                    else {
                                      _pMI = 0;
                                    }
                                    if (_downPayment == 100.0)
                                      {
                                        _monthlyPayment =
                                            _propertyTaxes + _insurance +
                                                _capitalExpenditure + _pMI +
                                                (_monthlyRent * _vacancy);
                                      }
                                    else {
                                      _monthlyPayment =
                                          _mortgage + _propertyTaxes + _insurance +
                                              _capitalExpenditure + _pMI +
                                              (_monthlyRent * _vacancy);
                                    }
                                    print(_mortgage);
                                    print(_propertyTaxes);
                                    print(_insurance);
                                    print(_capitalExpenditure);
                                    print(_monthlyRent*_vacancy);
                                    print('_monthlyPayment');
                                    print(_monthlyPayment);
                                    print(_pMI);

                                    _cashFlow = _monthlyRent - _monthlyPayment;
                                    _cashFlow = double.parse((_cashFlow).toStringAsFixed(2));
                                    print(_cashFlow);

                                    _cashOnCashReturn = ((_cashFlow * 12) /
                                        (_downPaymentTotal + _closingCosts + _repairs + _monthlyPayment * 12)) * 100;
                                    _cashOnCashReturn =
                                        double.parse((_cashOnCashReturn).toStringAsFixed(2));
                                    print(_downPaymentTotal);
                                    print(_cashOnCashReturn);
                                    print('Monthly Payment');
                                    print(_monthlyPayment);

                                    _monthlyPayment = double.parse((_monthlyPayment).toStringAsFixed(2));
                                    print(_monthlyPayment);
                                  });
                                },
                                child: Text('Enter',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Quicksand',
                                    letterSpacing: 2.0,
                                    fontSize: 30.0,

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Monthly Payment:',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.lightBlueAccent,
                                letterSpacing: 2.0,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            new Text('\$' + '$_monthlyPayment',
                              style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                letterSpacing: 2.0,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cash flow:',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.lightBlueAccent,
                                letterSpacing: 2.0,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            new Text('\$' + '$_cashFlow',
                              style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                letterSpacing: 2.0,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cash on cash return:',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.lightBlueAccent,
                                letterSpacing: 2.0,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            new Text('$_cashOnCashReturn' + '%',
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                                fontFamily: 'Quicksand',
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
      ),
    );
  }
}