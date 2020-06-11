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
  FSearchController controller4;
  FSearchController controller5;
  FSearchController controller6_1;
  FSearchController controller6_2;
  FSearchController controller6_3;
  FSearchController controller7;

  bool searching1 = false;
  bool searching2 = false;
  bool searching3 = false;
  bool searching4 = false;
  bool searching5 = false;
  bool searching6_1 = false;
  bool searching6_2 = false;
  bool searching6_3 = false;
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
    controller4 = FSearchController();
    controller5 = FSearchController();
    controller6_1 = FSearchController();
    controller6_2 = FSearchController();
    controller6_3 = FSearchController();
    controller7 = FSearchController();
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
                buildTitle("Gradient"),
                buildBigMargin(),

                /// demo3
                buildDemo3(),

                buildBigMargin(),
                buildTitle("Corner & Stroke & Shadow"),
                buildBigMargin(),

                /// demo4
                buildDemo4(),

                buildBigMargin(),
                buildTitle("Cursor"),
                buildBigMargin(),

                /// demo5
                buildDemo5(),

                buildBigMargin(),
                buildTitle("Hint"),
                buildBigMargin(),

                /// demo6
                buildDemo6(),

                buildBigMargin(),
                buildTitle("Controller"),
                buildBigMargin(),

                /// demo7
                buildDemo7(),

                buildBigMargin(),
                buildTitle("More"),
                buildBigMargin(),

                buildBiggestMargin(),
                buildBiggestMargin(),
                buildBiggestMargin(),
                buildBiggestMargin(),
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
          style: TextStyle(fontSize: 16.0, height: 1.0, color: Colors.grey),
          margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
          padding:
              EdgeInsets.only(left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
          prefixes: [
            const SizedBox(width: 6.0),
            Icon(
              Icons.search,
              size: 18,
              color: mainTextTitleColor,
            ),
            const SizedBox(width: 3.0)
          ],

          /// 点击键盘搜索时触发
          ///
          /// Fired when you click on the keyboard to search
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
          style: TextStyle(fontSize: 16.0, height: 1.0, color: Colors.grey),
          margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
          padding:
              EdgeInsets.only(left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
          prefixes: [
            const SizedBox(width: 6.0),
            Icon(
              Icons.search,
              size: 18,
              color: mainTextTitleColor,
            ),
            const SizedBox(width: 3.0)
          ],
          suffixes: [
            FButton(
              onPressed: () {
                dialog(context, "Smile 😊");
              },
              padding: EdgeInsets.only(left: 6.0, right: 6.0),
              color: Colors.transparent,
              effect: true,
              image: Icon(
                Icons.camera_enhance,
                size: 18,
                color: mainTextTitleColor,
              ),
            ),
            FButton(
              onPressed: () {
                controller2.text = null;
              },
              padding: EdgeInsets.only(left: 6.0, right: 6.0),
              color: Colors.transparent,
              effect: true,
              image: Icon(
                Icons.clear,
                size: 18,
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
              onClick: () {
                dialog(context, "Back!");
              },
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
    return StatefulBuilder(builder: (context, setState) {
      return PageWidget(
        searching: searching3,
        done: () => searching3 = false,
        child: Center(
          child: FSearch(
            /// 渐变色
            ///
            /// gradient
            gradient: LinearGradient(
              colors: [
                Colors.blue[50],
                Colors.red[50],
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            height: 30.0,
//          backgroundColor: mainBackgroundColor,
            style: TextStyle(fontSize: 16.0, height: 1.0, color: Colors.grey),
            margin: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 38.0),
            corner: FSearchCorner.all(6.0),
            padding:
                EdgeInsets.only(left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
            prefixes: [
              const SizedBox(width: 6.0),
              Icon(
                Icons.search,
                size: 18,
                color: mainTextTitleColor,
              ),
              const SizedBox(width: 3.0)
            ],

            /// 点击键盘搜索时触发
            ///
            /// Fired when you click on the keyboard to search
            onSearch: (value) {
              setState(() {
                searching3 = true;
              });
            },
          ),
        ),
      );
    });
  }

  Widget buildDemo4() {
    return StatefulBuilder(builder: (context, setState) {
      return PageWidget(
        searching: searching4,
        done: () => searching4 = false,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FSearch(
                height: 30.0,
                backgroundColor: mainBackgroundColor,

                /// 边角
                ///
                /// Corner
                corner: FSearchCorner(
                    leftTopCorner: 15.0,
                    leftBottomCorner: 15.0,
                    rightBottomCorner: 15.0),

                /// 边框宽
                ///
                /// border width
                strokeWidth: 1.0,

                /// 边框颜色
                ///
                /// border color
                strokeColor: mainTextTitleColor,

                /// 阴影
                ///
                /// shadow
                shadowColor: Colors.black38,
                shadowBlur: 5.0,
                shadowOffset: Offset(2.0, 2.0),
                style:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.grey),
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
                padding: EdgeInsets.only(
                    left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                prefixes: [
                  const SizedBox(width: 6.0),
                  Icon(
                    Icons.search,
                    size: 18,
                    color: mainTextTitleColor,
                  ),
                  const SizedBox(width: 3.0)
                ],

                /// 点击键盘搜索时触发
                ///
                /// Fired when you click on the keyboard to search
                onSearch: (value) {
                  setState(() {
                    searching4 = true;
                  });
                },
              ),
              const SizedBox(height: 56.0),
              FSearch(
                height: 30.0,
                backgroundColor: mainBackgroundColor,

                /// 边角
                ///
                /// Corner
                corner: FSearchCorner.all(6.0),

                /// 边角风格
                ///
                /// Corner style
                cornerStyle: FSearchCornerStyle.bevel,

                /// 边框宽
                ///
                /// border width
                strokeWidth: 0.5,

                /// 边框颜色
                ///
                /// border color
                strokeColor: mainTextTitleColor,

                /// 阴影
                ///
                /// shadow
                shadowColor: Colors.black38,
                shadowBlur: 5.0,
                shadowOffset: Offset(2.0, 2.0),
                style:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.grey),
                margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
                padding: EdgeInsets.only(
                    left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                prefixes: [
                  const SizedBox(width: 6.0),
                  Icon(
                    Icons.search,
                    size: 18,
                    color: mainTextTitleColor,
                  ),
                  const SizedBox(width: 3.0)
                ],

                /// 点击键盘搜索时触发
                ///
                /// Fired when you click on the keyboard to search
                onSearch: (value) {
                  setState(() {
                    searching4 = true;
                  });
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildDemo5() {
    return StatefulBuilder(builder: (context, setState) {
      return PageWidget(
        searching: searching5,
        done: () => searching5 = false,
        child: Center(
          child: FSearch(
            /// 光标
            ///
            /// Cursor
            cursorColor: Colors.red[200],
            cursorRadius: 5.0,
            cursorWidth: 5.0,
            gradient: LinearGradient(
              colors: [
                Colors.deepOrange[100],
                Colors.amber[50],
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            shadowColor: mainShadowColor,
            shadowBlur: 5.0,
            shadowOffset: Offset(3.0, 3.0),
            height: 36.0,
            corner: FSearchCorner(
                leftTopCorner: 18.0,
                leftBottomCorner: 18.0,
                rightBottomCorner: 18.0),
            style: TextStyle(fontSize: 18.0, height: 1.2, color: Colors.white),
            margin: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 38.0),
            padding:
                EdgeInsets.only(left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
            prefixes: [
              const SizedBox(width: 6.0),
              Icon(
                Icons.search,
                size: 22,
                color: Colors.white,
              ),
              const SizedBox(width: 3.0)
            ],
            suffixes: [
              FButton(
                onPressed: () {
                  dialog(context, "Smile 😊");
                },
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                effect: true,
                corner: FButtonCorner(rightBottomCorner: 18.0),
                color: Colors.transparent,
                image: Icon(
                  Icons.camera_enhance,
                  color: Colors.white,
                ),
              )
            ],

            /// 点击键盘搜索时触发
            ///
            /// Fired when you click on the keyboard to search
            onSearch: (value) {
              setState(() {
                searching5 = true;
              });
            },
          ),
        ),
      );
    });
  }

  Widget buildDemo6() {
    return StatefulBuilder(builder: (context, setState) {
      return PageWidget(
        width: 300,
        height: 400,
        searching: searching6_1,
        done: () => searching6_1 = false,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// #1
              FSearch(
                shadowColor: mainShadowColor,
                shadowBlur: 5.0,
                shadowOffset: Offset(3.0, 3.0),
                height: 36.0,
                corner: FSearchCorner.all(3.0),
                backgroundColor: Colors.white,
                style: TextStyle(
                    fontSize: 14.0, height: 1.2, color: Color(0xff333333)),
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
                padding: EdgeInsets.only(
                    left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                prefixes: [
                  const SizedBox(width: 6.0),
                  Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 3.0)
                ],
                suffixes: [
                  FButton(
                    onPressed: () {
                      dialog(context, "Speaking...");
                    },
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    effect: true,
                    color: Colors.transparent,
                    image: Icon(
                      Icons.mic,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )
                ],

                /// Hints
                hints: [
                  "FSuper is awesome 👍",
                  "Come to use FButton",
                  "You will love FRefresh",
                ],

                /// 开启 hint 交换动画
                ///
                /// Turn on hint exchange animation
                hintSwitchEnable: true,

                /// 配置 hint 交换动画类型
                ///
                /// Configure hint exchange animation type
                hintSwitchType: FSearchAnimationType.Fade,

                /// 点击键盘搜索时触发
                ///
                /// Fired when you click on the keyboard to search
                onSearch: (value) {
                  setState(() {
                    searching6_1 = true;
                  });
                },
              ),
              const SizedBox(height: 36.0),

              /// #2
              FSearch(
                shadowColor: mainShadowColor,
                shadowBlur: 5.0,
                shadowOffset: Offset(3.0, 3.0),
                height: 36.0,
                corner: FSearchCorner.all(18.0),
                backgroundColor: Colors.white,
                style: TextStyle(
                    fontSize: 14.0, height: 1.2, color: Color(0xff333333)),
                margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
                padding: EdgeInsets.only(
                    left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                prefixes: [
                  const SizedBox(width: 6.0),
                  Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(width: 3.0)
                ],
                suffixes: [
                  FButton(
                    onPressed: () {
                      dialog(context, "Smile 😊");
                    },
                    padding: EdgeInsets.only(left: 3.0, right: 3.0),
                    effect: true,
                    color: Colors.transparent,
                    image: Icon(
                      Icons.photo_camera,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  FButton(
                    text: "Search",
                    textColor: Colors.white,
                    fontSize: 10.0,
                    height: 30.0,
                    onPressed: () {
                      setState(() {
                        searching6_1 = true;
                      });
                    },
                    padding: EdgeInsets.only(left: 6.0, right: 6.0),
                    corner: FButtonCorner.all(15.0),
                    effect: true,
                    gradient: LinearGradient(colors: [
                      Colors.orange[500],
                      Colors.orange[900],
                    ]),
                  ),
                  const SizedBox(width: 6.0),
                ],
                hints: [
                  "Do you want to try FFloat?😃",
                  "FRadio can do more 😱 !",
                  "I heard that you have been waiting for FDottedLine for a long time...",
                ],
                hintSwitchEnable: true,

                /// 点击键盘搜索时触发
                ///
                /// Fired when you click on the keyboard to search
                onSearch: (value) {
                  setState(() {
                    searching6_1 = true;
                  });
                },
              ),
              const SizedBox(height: 36.0),

              /// #3
              FSearch(
                shadowColor: Colors.blue[100],
                shadowBlur: 5.0,
                shadowOffset: Offset(3.0, 3.0),
                height: 36.0,
                corner: FSearchCorner.all(9.0),
                cornerStyle: FSearchCornerStyle.bevel,
                strokeColor: Colors.blue[200],
                strokeWidth: 0.5,
                backgroundColor: Colors.white,
                style: TextStyle(
                    fontSize: 14.0, height: 1.2, color: Color(0xff333333)),
                margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
                padding: EdgeInsets.only(
                    left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                prefixes: [
                  const SizedBox(width: 6.0),
                  Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(width: 3.0)
                ],
                suffixes: [
                  FButton(
                    text: "Inquire",
                    textColor: Colors.white,
                    fontSize: 10.0,
                    corner: FButtonCorner(
                        leftTopCorner: 5.0,
                        leftBottomCorner: 5.0,
                        rightBottomCorner: 9.0,
                        rightTopCorner: 9.0),
                    cornerStyle: FButtonCornerStyle.bevel,
                    onPressed: () {
                      dialog(context, "Inquiry...");
                    },
                    padding: EdgeInsets.only(left: 14.0, right: 12.0),
                    effect: true,
                    color: Colors.blue[300],
                  )
                ],

                /// Hints
                hints: [
                  "Embrace FWidget 👬",
                  "We care about your app 🥰",
                  "Want to build beautiful apps 🤨 ?",
                ],

                /// 开启 hint 交换动画
                ///
                /// Turn on hint exchange animation
                hintSwitchEnable: true,

                /// 配置 hint 交换动画类型
                ///
                /// Configure hint exchange animation type
                hintSwitchType: FSearchAnimationType.Scale,

                /// 获得焦点时是否停止交换动画
                ///
                /// Whether to stop exchanging animation when focus is obtained
                stopHintSwitchOnFocus: false,

                /// 点击键盘搜索时触发
                ///
                /// Fired when you click on the keyboard to search
                onSearch: (value) {
                  setState(() {
                    searching6_1 = true;
                  });
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  String text_7 = "";

  Widget buildDemo7() {
    return StatefulBuilder(builder: (context, setState) {
      return PageWidget(
        width: 300,
        height: 250,
        searching: searching7,
        done: () => searching7 = false,
        child: Padding(
          padding: EdgeInsets.only(top: 38.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FSearch(
                controller: controller7,
                cursorColor: Colors.red[200],
                cursorRadius: 2.0,
                cursorWidth: 3.0,
                gradient: LinearGradient(
                  colors: [
                    Colors.red[100],
                    Colors.purple[50],
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shadowColor: mainShadowColor,
                shadowBlur: 5.0,
                shadowOffset: Offset(3.0, 3.0),
                height: 36.0,
                corner: FSearchCorner(
                    leftTopCorner: 18.0,
                    leftBottomCorner: 18.0,
                    rightBottomCorner: 18.0),
                style:
                    TextStyle(fontSize: 16.0, height: 1.2, color: Colors.white),
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
                padding: EdgeInsets.only(
                    left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                prefixes: [
                  const SizedBox(width: 6.0),
                  Icon(
                    Icons.search,
                    size: 22,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 3.0)
                ],
                suffixes: [
                  FButton(
                    onPressed: () {
                      dialog(context, "Say something.. 😊");
                    },
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    effect: true,
                    corner: FButtonCorner(rightBottomCorner: 18.0),
                    color: Colors.transparent,
                    image: Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                  )
                ],

                hints: [
                  "Want more beautiful widgets 🤨 ?",
                  "We will launch the official website of FWidget",
                  "Will you expect it?",
                ],
                hintStyle: TextStyle(
                    fontSize: 12.0, height: 1.0, color: Colors.grey[400]),
                hintSwitchEnable: true,

                /// 点击键盘搜索时触发
                ///
                /// Fired when you click on the keyboard to search
                onSearch: (value) {
                  setState(() {
                    searching7 = true;
                  });
                },
              ),
              const SizedBox(height: 38.0),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 6.0,
                runSpacing: 9.0,
                children: [
                  FButton(
                    width: 60,
                    text: "GetText",
                    textColor: Colors.white,
                    fontSize: 12.0,
                    color: Colors.teal[200],
                    padding: EdgeInsets.only(
                        left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                    corner: FButtonCorner.all(10.0),
                    shadowColor: mainShadowColor,
                    shadowBlur: 5.0,
                    shadowOffset: Offset(3.0, 3.0),
                    effect: true,
                    onPressed: () {
                      setState(() {
                        text_7 = "text = ${controller7.text}";
                      });
                    },
                  ),
                  FButton(
                    width: 60,
                    text: "GetHint",
                    textColor: Colors.white,
                    fontSize: 12.0,
                    color: Colors.teal[200],
                    padding: EdgeInsets.only(
                        left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                    corner: FButtonCorner.all(10.0),
                    shadowColor: mainShadowColor,
                    shadowBlur: 5.0,
                    shadowOffset: Offset(3.0, 3.0),
                    effect: true,
                    onPressed: () {
                      setState(() {
                        text_7 = "hint = ${controller7.hint}";
                      });
                    },
                  ),
                  FButton(
                    width: 50,
                    text: "Clear",
                    textColor: Colors.white,
                    fontSize: 12.0,
                    color: Colors.teal[200],
                    padding: EdgeInsets.only(
                        left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                    corner: FButtonCorner.all(10.0),
                    shadowColor: mainShadowColor,
                    shadowBlur: 5.0,
                    shadowOffset: Offset(3.0, 3.0),
                    effect: true,
                    onPressed: () {
                      controller7.text = null;
                    },
                  ),
                  FButton(
                    width: 80,
                    text: "ClearFocus",
                    textColor: Colors.white,
                    fontSize: 12.0,
                    color: Colors.teal[200],
                    padding: EdgeInsets.only(
                        left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                    corner: FButtonCorner.all(10.0),
                    shadowColor: mainShadowColor,
                    shadowBlur: 5.0,
                    shadowOffset: Offset(3.0, 3.0),
                    effect: true,
                    onPressed: () {
                      controller7.clearFocus();
                    },
                  ),
                  FButton(
                    width: 100,
                    text: "RequestFocus",
                    textColor: Colors.white,
                    fontSize: 12.0,
                    color: Colors.teal[200],
                    padding: EdgeInsets.only(
                        left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
                    corner: FButtonCorner.all(10.0),
                    shadowColor: mainShadowColor,
                    shadowBlur: 5.0,
                    shadowOffset: Offset(3.0, 3.0),
                    effect: true,
                    onPressed: () {
                      controller7.requestFocus();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Container(
                width: 280.0,
                alignment: Alignment.center,
                child: Text(
                  text_7,
                  style: TextStyle(color: Colors.grey[300]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class PageWidget extends StatefulWidget {
  Widget child;
  bool searching;
  VoidCallback done;
  double width;
  double height;

  PageWidget({
    this.width = 200.0,
    this.height = 300.0,
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
        width: widget.width,
        height: widget.height,
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
      width: widget.width,
      height: widget.height,
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
