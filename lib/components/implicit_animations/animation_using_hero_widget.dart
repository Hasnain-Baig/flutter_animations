import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHeroWidgetAnimation extends StatefulWidget {
  const MyHeroWidgetAnimation({Key? key}) : super(key: key);

  @override
  State<MyHeroWidgetAnimation> createState() => _MyHeroWidgetAnimationState();
}

class _MyHeroWidgetAnimationState extends State<MyHeroWidgetAnimation> {
  void myDialogBox() {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
            child:
                Hero(tag: "cr7", child: Image.asset("assets/images/cr7.jpg")),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Hero(
          tag: "cr7",
          child: GestureDetector(
            onTap: () {
              myDialogBox();
            },
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 50,
              child: ClipOval(
                child: Image.asset("assets/images/cr7.jpg", fit: BoxFit.cover),
              ),
            ),
          )),
    );
  }
}
