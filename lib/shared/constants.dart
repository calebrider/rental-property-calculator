import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


var textInputDecoration = InputDecoration(
  fillColor: Colors.transparent,
  filled: true,
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
      borderRadius: const BorderRadius.all(const Radius.circular(100.0))
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: const BorderRadius.all(const Radius.circular(100.0))
  ),

);

final textInputStyle = TextStyle(
  height: 0.6,
  color: Colors.grey[600],
  fontFamily: 'Quicksand',
  fontSize: 22.0,
  letterSpacing: 2.0,
);

final inputLabelStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 18.0,
      letterSpacing: 2.0,
      color: Colors.grey[600],
);

final neumorphicTextFieldStyle = NeumorphicStyle(
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100.0)),
  depth: 5,
  shadowDarkColor: Colors.lightBlueAccent,
  color: Colors.white,
  intensity: 0.60,
);

final neumorphicDropdownButtonStyle = NeumorphicStyle(
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100.0)),
  depth: 5,
  shadowDarkColor: Colors.lightBlueAccent,
  color: Colors.lightBlue,
  intensity: 0.60,
);

final neumorphicDisplayStyle = NeumorphicStyle(
  depth: 10,
  color: Colors.white,
  shadowLightColor: Colors.lightBlueAccent,
  intensity: 0.6,
  disableDepth: false,
  shape: NeumorphicShape.convex,
  border: NeumorphicBorder(
    width: 2,
    //isEnabled: true,
    color: Colors.lightBlueAccent,
  ),
);