import 'package:flutter/material.dart';
import '../../models/myTitle.dart';

class MyAnimationController3 extends StatefulWidget {
  const MyAnimationController3({Key? key}) : super(key: key);

  @override
  State<MyAnimationController3> createState() => _MyAnimationController3State();
}

class _MyAnimationController3State extends State<MyAnimationController3> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> itemWidget = [];

  Tween<Offset> _offset = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      addList();
    });
  }

  void addList() {
    List<MyTitle> _titles = [
      MyTitle(title: "Ali"),
      MyTitle(title: "Farhan"),
      MyTitle(title: "Rubab"),
      MyTitle(title: "Raju"),
      MyTitle(title: "Amna"),
      MyTitle(title: "Shafiq"),
      MyTitle(title: "Farhana"),
      MyTitle(title: "Mani"),
      MyTitle(title: "Naima"),
      MyTitle(title: "Durdana"),
      MyTitle(title: "Rehman"),
    ];

    Future ft = Future(() {});
    _titles.forEach((MyTitle t) {
      ft = ft.then((value) {
        return Future.delayed(Duration(milliseconds: 100), () {
          itemWidget.add(buildItemContainer(t));
          _listKey.currentState?.insertItem(itemWidget.length - 1);
        });
      });
    });
  }

  Widget buildItemContainer(MyTitle t) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      color: Colors.amber,
      width: MediaQuery.of(context).size.width * 1,
      height: 50,
      child: Text(
        "${t.title}",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: AnimatedList(
            key: _listKey,
            initialItemCount: itemWidget.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                  position: animation.drive(_offset), child: itemWidget[index]);
            }));
  }
}
