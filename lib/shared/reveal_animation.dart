import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

double _containerHeight = 200;

class AnimatePage extends StatefulWidget {
  @override
  _AnimatePageState createState() => _AnimatePageState();
}

class _AnimatePageState extends State<AnimatePage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation _colorAnimation;
  Animation _heightAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this
    );

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.lightBlueAccent).animate(new CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
    _heightAnimation = Tween<double>(begin: 10, end: 200).animate(new CurvedAnimation(parent: _animationController, curve: Curves.elasticOut));

    _animationController.forward();

    _animationController.addListener(() {
      print(_animationController.value);
      print(_colorAnimation.value);
      print(_heightAnimation.value);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _colorAnimation,
            builder: (BuildContext context, _) {
              return Container(
                height: _heightAnimation.value,
                color: _colorAnimation.value,
              );
            }
          ),
        ],
      ),
    );
  }
}
