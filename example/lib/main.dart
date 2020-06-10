import 'dart:async';

import 'package:fbutton/fbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsearch/fsearch.dart';
import 'package:fsearch_example/color.dart';
import 'package:fsearch_example/part.dart';
import 'package:fsuper/fsuper.dart';

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

  bool searching1 = false;
  bool searching2 = false;
  bool searching3 = false;
  bool searching4 = false;
  bool searching5 = false;
  bool searching6 = false;
  bool searching7 = false;

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
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTitle("Base Demo"),
                buildBigMargin(),

                /// demo1
                buildDemo1(context),

                buildBigMargin(),
                buildTitle("Prefixes & Suffixes"),
                buildBigMargin(),

                /// demo2
                buildDemo2(),

                buildBigMargin(),
                buildTitle("Background"),
                buildBigMargin(),

                /// demo3
                buildDemo3(),

                buildBigMargin(),
                buildTitle("Corner & Stroke"),
                buildBigMargin(),

                /// demo4
//              buildDemo4(),

                buildBigMargin(),
                buildTitle("Cursor"),
                buildBigMargin(),

                /// demo5
//              buildDemo5(),

                buildBigMargin(),
                buildTitle("Hint"),
                buildBigMargin(),

                /// demo7
//              buildDemo7(),

                buildBigMargin(),
                buildTitle("Controller"),
                buildBigMargin(),

                /// demo8
//              buildDemo8(),

                buildBigMargin(),
                buildTitle("More"),
                buildBigMargin(),

                buildBiggestMargin(),
                buildBiggestMargin(),
                buildBiggestMargin(),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget buildDemo1(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return PageWidget(
        searching: searching1,
        done: () => searching1 = false,
        child: FSearch(
          height: 30.0,
          backgroundColor: mainBackgroundColor,
          style: TextStyle(fontSize: 16.0, height: 1.0),
          margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
          padding:
              EdgeInsets.only(left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
          prefixes: [
            const SizedBox(width: 6.0),
            Icon(
              Icons.search,
              size: 22,
              color: mainTextTitleColor,
            ),
            const SizedBox(width: 3.0)
          ],
          onSearch: (value) {
            setState(() {
              searching1 = true;
            });
          },
        ),
      );
    });
  }

  Widget buildDemo2() {
    return StatefulBuilder(builder: (context, setState) {
      return PageWidget(
        searching: searching2,
        done: () => searching2 = false,
        child: FSearch(
          controller: controller2,
          height: 30.0,
          backgroundColor: mainBackgroundColor,
          style: TextStyle(fontSize: 16.0, height: 1.0),
          margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
          padding:
              EdgeInsets.only(left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
          prefixes: [
            const SizedBox(width: 6.0),
            Icon(
              Icons.search,
              size: 22,
              color: mainTextTitleColor,
            ),
            const SizedBox(width: 3.0)
          ],
          suffixes: [
            FButton(
              onPressed: () {
                print('onPressed');
                controller2.text = null;
              },
              padding: EdgeInsets.only(left: 6.0, right: 6.0),
              color: Colors.transparent,
              effect: true,
              image: Icon(
                Icons.clear,
                size: 16,
                color: mainTextTitleColor,
              ),
            ),
            FSuper(
              text: "Back",
              textColor: mainTextTitleColor,
              fontHeight: 1.0,
              height: 30,
              textAlignment: Alignment.center,
              backgroundColor: Colors.white,
              padding: EdgeInsets.only(left: 6.0),
            )
          ],
          onSearch: (value) {
            setState(() {
              searching2 = true;
            });
          },
        ),
      );
    });
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
//        InkWell(
//          onTap: (){
//            controller3.requestFocus();
//          },
//          child: Icon(Icons.camera),
//        ),
        const SizedBox(width: 6.0),
        InkWell(
          onTap: () {
            print('onTap');
            controller3.text = "";
            controller3.clearFocus();
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

class PageWidget extends StatefulWidget {
  Widget child;
  bool searching;
  VoidCallback done;

  PageWidget({
    this.child,
    this.done,
    this.searching = false,
  });

  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  Timer hideSearching;

  @override
  Widget build(BuildContext context) {
    hideSearching?.cancel();
    List<Widget> children = [];
    children.add(Positioned(
      child: widget.child,
    ));
    if (widget.searching) {
      children.add(FSuper(
        width: 200,
        height: 300,
        backgroundColor: Colors.black26,
        corner: Corner.all(6.0),
      ));
      children.add(Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoActivityIndicator(),
            const SizedBox(height: 6.0),
            Text(
              "Searching...",
              style: TextStyle(color: mainTextTitleColor),
            )
          ],
        ),
      ));
      hideSearching = Timer(Duration(milliseconds: 2000), () {
        setState(() {
          widget.searching = false;
          widget.done?.call();
        });
      });
    }
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        boxShadow: [
          BoxShadow(
              color: mainShadowColor, blurRadius: 6.0, offset: Offset(3, 3)),
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: children,
      ),
    );
  }
}
