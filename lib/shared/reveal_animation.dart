import 'package:flutter/material.dart';

double _containerHeight = 200;

class AnimatePage extends StatefulWidget {
  @override
  _AnimatePageState createState() => _AnimatePageState();
}

class _AnimatePageState extends State<AnimatePage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this
    );

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_animationController);

    _animationController.forward();

    _animationController.addListener(() {
      print(_animationController.value);
      print(_colorAnimation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (BuildContext context, _) {
        return Container(
          height: _containerHeight,
          color: _colorAnimation.value,
        );
      }
    );
  }
}
