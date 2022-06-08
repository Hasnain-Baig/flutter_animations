import 'package:flutter/material.dart';

class MyAnimationController2 extends StatefulWidget {
  const MyAnimationController2({Key? key}) : super(key: key);

  @override
  State<MyAnimationController2> createState() => _MyAnimationController2State();
}

class _MyAnimationController2State extends State<MyAnimationController2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: 1),
        // curve: Curves.easeInQuart,
        // curve: Curves.bounceIn,
        curve: Curves.easeIn,
        builder: (context, double _val, _child) {
          return Opacity(
            opacity: _val,
            child: Padding(
                padding: EdgeInsets.only(
                  top: _val * 50,
                ),
                child: _child),
          );
        },
        child: Text(
          "Title",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
