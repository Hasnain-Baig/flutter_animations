import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        duration: Duration(seconds: 1),
        child: Column(children: [
          RaisedButton(
            onPressed: () {
              setState(() {
                _margin = 20;
              });
            },
            child: Text("Animate Margin"),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _color = Colors.purple;
              });
            },
            child: Text("Animate Color"),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _width = 300;
              });
            },
            child: Text("Animate Width"),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _opacity = 0;
              });
            },
            child: Text("Animate Opacity"),
          ),
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: _opacity,
            child: Text(
              "hide me! using opacity",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ]),
      ),
    );
  }
}
