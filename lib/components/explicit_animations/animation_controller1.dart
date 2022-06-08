import 'package:flutter/material.dart';

class MyAnimationController1 extends StatefulWidget {
  const MyAnimationController1({Key? key}) : super(key: key);

  @override
  State<MyAnimationController1> createState() => _MyAnimationController1State();
}

class _MyAnimationController1State extends State<MyAnimationController1>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;
  late bool isFav = false;
  late Animation _sizeAnimation;
  late Animation<double> _curve;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _curve =
        CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);

    // _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
    //     .animate(_animationController);
    _colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_curve);
    // _animationController.forward();

    // _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
    //   TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 50),
    //   TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50)
    // ]).animate(_animationController);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50)
    ]).animate(_curve);

    _animationController.addListener(() {
      // setState(() {});
      print("Animation Value==>${_animationController.value}");
      print("Animation Size==>${_sizeAnimation.value}");
      print("Animation Color==>${_colorAnimation.value}");
    });

    _animationController.addStatusListener((status) {
      print("Animation Status==>${status}");
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, _) {
            return IconButton(
              icon: Icon(
                Icons.favorite,
                color: _colorAnimation.value,
                size: _sizeAnimation.value,
              ),
              onPressed: () {
                isFav
                    ? _animationController.reverse()
                    : _animationController.forward();
              },
            );
          },
        ));
  }
}
