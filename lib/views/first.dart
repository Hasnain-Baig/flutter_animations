import 'package:flutter/material.dart';
import 'package:flutter_animations/components/explicit_animations/animation_controller1.dart';
import 'package:get/get.dart';

import '../components/explicit_animations/animation_controller2.dart';
import '../components/explicit_animations/animation_controller3.dart';
import '../components/implicit_animations/animation_using_animated_container.dart';
import '../components/implicit_animations/animation_using_hero_widget.dart';
import '../components/implicit_animations/animation_using_tween.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Implicit Or Built In Animation",
              style: TextStyle(
                fontSize: 20,
              )),
          ElevatedButton(
              onPressed: () {
                Get.to(MyAnimatedContainer());
              },
              child: Text("Animated Container Animations")),
          ElevatedButton(
              onPressed: () {
                Get.to(MyCustomTweenAnimation());
              },
              child: Text("Tween Animations")),
          ElevatedButton(
              onPressed: () {
                Get.to(MyHeroWidgetAnimation());
              },
              child: Text("Hero Widget Animations")),
          SizedBox(
            height: 30,
          ),
          Text("Explicit Or Animation Controller  Animation",
              style: TextStyle(
                fontSize: 20,
              )),
          ElevatedButton(
              onPressed: () {
                Get.to(MyAnimationController1());
              },
              child: Text("Animated Controller 1")),
          ElevatedButton(
              onPressed: () {
                Get.to(MyAnimationController2());
              },
              child: Text("Animated Controller 2")),
          ElevatedButton(
              onPressed: () {
                Get.to(MyAnimationController3());
              },
              child: Text("Animated Controller 3")),
        ],
      ),
    );
  }
}
