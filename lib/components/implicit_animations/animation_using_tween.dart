import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyCustomTweenAnimation extends StatefulWidget {
  const MyCustomTweenAnimation({Key? key}) : super(key: key);

  @override
  State<MyCustomTweenAnimation> createState() => _MyCustomTweenAnimationState();
}

class _MyCustomTweenAnimationState extends State<MyCustomTweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: 1),
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
