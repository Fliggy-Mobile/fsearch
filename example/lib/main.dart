import 'package:flutter/material.dart';
import 'package:fsearch/fsearch.dart';
import 'package:fsearch_example/color.dart';
import 'package:fsearch_example/part.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FSearchController controller1;
  FSearchController controller2;
  FSearchController controller3;

  @override
  void initState() {
    controller1 = FSearchController();
    controller2 = FSearchController();
    controller3 = FSearchController();
    controller3.setListener(() {
      print(
          'controller3.text = ${controller3.text}, controller3.hint = ${controller3.hint}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mainBackgroundColor,
        appBar: AppBar(
          backgroundColor: mainBackgroundColor,
          title: const Text(
            'FSearch',
            style: TextStyle(color: mainTextTitleColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildTitle("Horizontal"),
              buildBigMargin(),

              /// demo1
              buildDemo1(),
              buildBigMargin(),
              buildTitle("Vertical"),
              buildBigMargin(),

              /// demo2
              buildDemo2(),

              buildBigMargin(),
              buildTitle("Shape"),
              buildBigMargin(),

              /// demo3
              buildDemo3(),

              buildBigMargin(),
              buildTitle("Corner"),
              buildBigMargin(),

              /// demo4
//              buildDemo4(),

              buildBigMargin(),
              buildTitle("Child"),
              buildBigMargin(),

              /// demo5
//              buildDemo5(),

              buildBigMargin(),

              /// demo6
//              buildDemo6(),

              buildBigMargin(),
              buildTitle("More"),
              buildBigMargin(),

              /// demo7
//              buildDemo7(),

              buildBigMargin(),
              buildBigMargin(),

              /// demo8
//              buildDemo8(),

              buildBiggestMargin(),
              buildBiggestMargin(),
              buildBiggestMargin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDemo1() {
    return FSearch(
      backgroundColor: Colors.white,
      corner: FSearchCorner.all(6.0),
      style: TextStyle(fontSize: 13.0),
      margin: EdgeInsets.all(9.0),
      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 2.0, bottom: 2.0),
      prefixes: [Icon(Icons.search)],
      suffixes: [
        Icon(Icons.camera),
        const SizedBox(width: 6.0),
        Icon(Icons.cancel),
      ],
      hints: ["hint0", "hint11", "hint222", "hint3333"],
      hintSwitchEnable: true,
      hintPrefix: Icon(Icons.map),
      center: true,
      hintSwitchType: FSearchAnimationType.Fade,
    );
  }

  Widget buildDemo2() {
    return FSearch(
      backgroundColor: Colors.white,
      corner: FSearchCorner.all(6.0),
      style: TextStyle(fontSize: 13.0),
      margin: EdgeInsets.all(9.0),
      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 2.0, bottom: 2.0),
      prefixes: [Icon(Icons.search)],
      suffixes: [
        Icon(Icons.camera),
        const SizedBox(width: 6.0),
        Icon(Icons.cancel),
      ],
      text: "TEst",
      hints: ["hint0", "hint11", "hint222", "hint3333"],
      hintSwitchEnable: true,
      hintPrefix: Icon(
        Icons.map,
        size: 12,
      ),
//      center: true,
      stopHintSwitchOnFocus: false,
      hintSwitchType: FSearchAnimationType.Scale,
    );
  }

  Widget buildDemo3() {
    return FSearch(
      controller: controller3,
      backgroundColor: Colors.white,
      corner: FSearchCorner.all(6.0),
      style: TextStyle(fontSize: 13.0),
      margin: EdgeInsets.all(9.0),
      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 2.0, bottom: 2.0),
      prefixes: [Icon(Icons.search)],
      suffixes: [
        Icon(Icons.camera),
        const SizedBox(width: 6.0),
        InkWell(
          onTap: (){
            controller3.text = "";
          },
          child: Icon(Icons.cancel),
        ),
      ],
      text: "TEst",
      hints: ["hint0", "hint11", "hint222", "hint3333"],
      hintSwitchEnable: true,
      hintPrefix: Icon(
        Icons.map,
        size: 12,
      ),
//      center: true,
      stopHintSwitchOnFocus: false,
    );
  }
}
