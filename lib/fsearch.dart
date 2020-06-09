import 'dart:async';

import 'package:flutter/material.dart';

enum FSearchAnimationType {
  /// 渐变动画
  ///
  /// Alpha animation
  Fade,

  /// 缩放动画
  ///
  /// Scale animation
  Scale,

  /// 上下滚动动画
  ///
  /// Scroll up and down animation
  Scroll,
}

class FSearch extends StatefulWidget {
  final FSearchController controller;

  final double width;

  final double height;

  final String text;

  final FSearchCorner corner;

  final Color strokeColor;

  final double strokeWidth;

  final FSearchCornerStyle cornerStyle;

  final ImageProvider backgroundImage;

  final Color backgroundColor;

  final Gradient gradient;

  final double shadowBlur;

  final Color shadowColor;

  final double shadowOffset;

  final Color cursorColor;

  final double cursorWidth;

  final double cursorRadius;

  final TextStyle style;

  final TextStyle hintStyle;

  final List<Widget> prefixes;

  final List<Widget> suffixes;

  final EdgeInsets padding;

  final EdgeInsets margin;

  final List<String> hints;

  final Duration hintSwitchDuration;

  final Duration hintSwitchAnimDuration;

  final bool hintSwitchEnable;

  final bool stopHintSwitchOnFocus;

  final Widget hintPrefix;

  final FSearchAnimationType hintSwitchType;

  final bool center;

  FSearch({
    Key key,
    this.text,
    this.width,
    this.height,
    this.corner,
    this.strokeColor,
    this.strokeWidth,
    this.cornerStyle = FSearchCornerStyle.round,
    this.backgroundImage,
    this.backgroundColor,
    this.gradient,
    this.shadowBlur,
    this.shadowColor,
    this.shadowOffset,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorRadius = 0.0,
    this.style,
    this.hintStyle,
    this.prefixes,
    this.suffixes,
    this.padding = EdgeInsets.zero,
    this.margin,
    this.hints,
    this.hintSwitchDuration = const Duration(milliseconds: 3000),
    this.hintSwitchAnimDuration = const Duration(milliseconds: 800),
    this.hintSwitchEnable = false,
    this.center = false,
    this.stopHintSwitchOnFocus = true,
    this.hintPrefix,
    this.controller,
    this.hintSwitchType = FSearchAnimationType.Scroll,
  }) : super(key: key);

  @override
  _FSearchState createState() => _FSearchState();
}

class _FSearchState extends State<FSearch> {
  String hint_0;
  String hint_1;
  int hintIndex = -1;
  double hintSwitchTop_0;
  double hintSwitchTop_1;
  double inputHeight;
  Duration hintSwitchDuration_0;
  Duration hintSwitchDuration_1;

  bool showHint = true;

  GlobalKey inputKey = GlobalKey();
  TextEditingController controller;
  bool scrollAnimPlaying = false;
  Timer switchTimer;
  FocusNode focusNode = FocusNode();

  String get hint {
    String r;
    if (widget.hints != null && widget.hints.length > 0) {
      if (hintIndex != -1) {
        r = widget.hints[hintIndex];
      } else {
        r = widget.hints[0];
      }
    }
    return r;
  }

  @override
  void initState() {
    widget.controller?._state = this;

    showHint = widget.hints != null && widget.hints.length > 0;
    hintSwitchDuration_0 = widget.hintSwitchAnimDuration;
    hintSwitchDuration_1 = widget.hintSwitchAnimDuration;

    controller = TextEditingController();

    /// 输入监听
    controller.addListener(() {
      bool hasText = false;
      if (controller.value.text != null && controller.value.text.length > 0) {
        hasText = true;
      }
      if (showHint != !hasText) {
        setState(() {
          showHint = !hasText;
          if (showHint &&
              !(focusNode.hasFocus && widget.stopHintSwitchOnFocus)) {
            playHintSwitchAnim();
          } else {
            switchTimer?.cancel();
            tryFixScrollAnim();
          }
        });
      }
      widget.controller?._listener?.call();
    });
    /// 首次初始化文字
    if (widget.controller != null && widget.text != null) {
      widget.controller.text = widget.text;
    } else if (widget.text != null) {
      controller.text = widget.text;
    }

    /// 焦点监听
    focusNode.addListener(() {
      if (focusNode.hasFocus && widget.stopHintSwitchOnFocus) {
        switchTimer?.cancel();
      } else {
        playHintSwitchAnim();
      }
      widget.controller?._focusListener?.call(focusNode.hasFocus);
    });
    super.initState();
  }

  void tryFixScrollAnim() {
    if (scrollAnimPlaying) {
      scrollAnimPlaying = false;
      if (hintSwitchTop_0 == -inputHeight) {
        setState(() {
          hintSwitchTop_0 = inputHeight;
          hintSwitchDuration_0 = Duration(milliseconds: 0);
        });
      } else {
        hintSwitchDuration_0 = widget.hintSwitchAnimDuration;
      }
      if (hintSwitchTop_1 == -inputHeight) {
        setState(() {
          hintSwitchTop_1 = inputHeight;
          hintSwitchDuration_1 = Duration(milliseconds: 0);
        });
      } else {
        hintSwitchDuration_1 = widget.hintSwitchAnimDuration;
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initInputHeight();
    Decoration decoration = buildDecoration();
    List<Widget> children = [];

    /// 添加前缀
    ///
    /// Add prefix
    if (widget.prefixes != null && widget.prefixes.length != 0) {
      children.addAll(widget.prefixes);
    }

    /// 构建输入区域
    ///
    /// Build input area
    Widget inputArea = buildInputArea();
    children.add(Expanded(child: inputArea));

    /// 添加后缀
    ///
    /// Add suffix
    if (widget.suffixes != null && widget.suffixes.length != 0) {
      children.addAll(widget.suffixes);
    }
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: decoration,
      alignment: Alignment.center,
      padding: widget.padding,
      margin: widget.margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  void initInputHeight() {
    if (inputHeight != null) return;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      RenderBox box = inputKey.currentContext?.findRenderObject();
      if (widget.hints != null &&
          widget.hints.length > 1 &&
          inputHeight == null) {
        setState(() {
          inputHeight = box.size.height;
          hintSwitchTop_0 = 0;
          hintSwitchTop_1 = inputHeight;
          hint_0 = widget.hints[0];
          hint_1 = widget.hints[1];
          playHintSwitchAnim();
        });
      }
    });
  }

  Widget buildInputArea() {
    List<Widget> children = [];

    TextStyle style = widget.style ?? buildDefaultTextStyle();
    Widget textField = TextField(
      focusNode: focusNode,
      key: inputKey,
      controller: controller,
      textAlign: widget.center ? TextAlign.center : TextAlign.start,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration.collapsed(hintText: ""),
      style: style,
      cursorColor: widget.cursorColor,
      cursorWidth: widget.cursorWidth,
      cursorRadius: Radius.circular(widget.cursorRadius),
    );
    children.add(textField);

    if (showHint) {
      if (widget.hintSwitchEnable && inputHeight != null) {
        int index = hintIndex == -1 ? 0 : hintIndex;
        if (widget.hintSwitchType == FSearchAnimationType.Fade) {
          Widget hintSwitcher = AnimatedSwitcher(
            child: IgnorePointer(
              key: ValueKey(index),
              child: Container(
                height: inputHeight,
                child: Text(
                  widget.hints[index],
                  style: widget.hintStyle ??
                      style.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
            ),
            duration: widget.hintSwitchAnimDuration,
          );
          children.add(hintSwitcher);
        } else if (widget.hintSwitchType == FSearchAnimationType.Scale) {
          Widget hintSwitcher = AnimatedSwitcher(
            child: IgnorePointer(
              key: ValueKey(index),
              child: Container(
                height: inputHeight,
                child: Text(
                  widget.hints[index],
                  style: widget.hintStyle ??
                      style.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
            ),
            duration: widget.hintSwitchAnimDuration,
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
              alignment: Alignment.centerLeft,
            ),
          );
          children.add(hintSwitcher);
        } else {
          /// 滚动动画
          ///
          /// transition anim
          Widget hintSwitch_0 = AnimatedPositioned(
            top: hintSwitchTop_0,
            child: IgnorePointer(
              child: Container(
                height: inputHeight,
                alignment: Alignment.center,
                child: Text(
                  hint_0,
                  style: widget.hintStyle ??
                      style.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
            ),
            duration: hintSwitchDuration_0,
            onEnd: () {
              scrollAnimPlaying = false;
              if (hintSwitchTop_0 == -inputHeight) {
                setState(() {
                  hintSwitchTop_0 = inputHeight;
                  hintSwitchDuration_0 = Duration(milliseconds: 0);
                });
              } else {
                hintSwitchDuration_0 = widget.hintSwitchAnimDuration;
              }
            },
          );
          Widget hintSwitch_1 = AnimatedPositioned(
            top: hintSwitchTop_1,
            child: IgnorePointer(
              child: Container(
                height: inputHeight,
                alignment: Alignment.center,
                child: Text(
                  hint_1,
                  style: widget.hintStyle ??
                      style.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
            ),
            duration: hintSwitchDuration_1,
            onEnd: () {
              if (hintSwitchTop_1 == -inputHeight) {
                setState(() {
                  hintSwitchTop_1 = inputHeight;
                  hintSwitchDuration_1 = Duration(milliseconds: 0);
                });
              } else {
                hintSwitchDuration_1 = widget.hintSwitchAnimDuration;
              }
            },
          );
          children.add(hintSwitch_0);
          children.add(hintSwitch_1);
        }
      } else {
        children.add(IgnorePointer(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.hintPrefix,
              Text(
                widget.hints[0],
                style: widget.hintStyle ??
                    style.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ));
      }
    }

    return Stack(
      alignment: widget.center ? Alignment.center : Alignment.centerLeft,
      children: children,
    );
  }

  void playHintSwitchAnim() {
    if (!widget.hintSwitchEnable ||
        !showHint ||
        inputHeight == null ||
        widget.hints == null ||
        widget.hints.length < 2) return;
    if (switchTimer != null) {
      switchTimer.cancel();
    }
    switchTimer = Timer(widget.hintSwitchDuration, () {
      if (!mounted &&
          showHint &&
          widget.hintSwitchEnable &&
          inputHeight != null) return;
      List<String> hints = widget.hints;
      if (widget.hintSwitchType != FSearchAnimationType.Scroll) {
        setState(() {
          hintIndex = (hintIndex + 1 == hints.length ? 0 : hintIndex + 1);
        });
      } else {
        double switchHintTop(double hintTop) {
          if (hintTop == 0) {
            hintTop = -inputHeight;
          } else if (hintTop == inputHeight) {
            hintTop = 0;
          } else {
            hintTop = inputHeight;
          }
          return hintTop;
        }

        setState(() {
          scrollAnimPlaying = true;
          hintIndex = (hintIndex + 1 == hints.length ? 0 : hintIndex + 1);
          int nextIndex = (hintIndex + 1 == hints.length ? 0 : hintIndex + 1);
          if (hintSwitchTop_0 == inputHeight) {
            hint_0 = hints[nextIndex];
          } else {
            hint_0 = hints[hintIndex];
          }
          if (hintSwitchTop_1 == inputHeight) {
            hint_1 = hints[nextIndex];
          } else {
            hint_1 = hints[hintIndex];
          }
          hintSwitchTop_0 = switchHintTop(hintSwitchTop_0);
          hintSwitchTop_1 = switchHintTop(hintSwitchTop_1);
        });
      }
      playHintSwitchAnim();
    });
  }

  TextStyle buildDefaultTextStyle() => TextStyle(
        color: Color(0xff333333),
        fontSize: 16.0,
      );

  Decoration buildDecoration() {
    double opacity = 0.38;
    BorderRadius borderRadius = widget.corner == null
        ? BorderRadius.all(Radius.circular(0))
        : BorderRadius.only(
            topLeft: Radius.circular(widget.corner.leftTopCorner),
            topRight: Radius.circular(widget.corner.rightTopCorner),
            bottomRight: Radius.circular(widget.corner.rightBottomCorner),
            bottomLeft: Radius.circular(widget.corner.leftBottomCorner),
          );
    Color sideColor = widget.strokeColor ?? Colors.transparent;
    BorderSide borderSide = BorderSide(
      width: widget.strokeWidth ?? 0,
      color: sideColor,
      style: BorderStyle.solid,
    );
    var shape = widget.cornerStyle == FSearchCornerStyle.round
        ? RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: borderSide,
          )
        : BeveledRectangleBorder(
            borderRadius: borderRadius,
            side: borderSide,
          );
    var decorationImage = widget.backgroundImage != null
        ? DecorationImage(
            fit: BoxFit.cover,
            image: widget.backgroundImage,
          )
        : null;
    Decoration decoration = ShapeDecoration(
        color: widget.backgroundColor,
        gradient: widget.gradient,
        image: decorationImage,
        shadows: widget.shadowColor != null && widget.shadowBlur != 0
            ? [
                BoxShadow(
                  color: widget.shadowColor ??
                      widget.backgroundColor.withOpacity(opacity),
                  offset: widget.shadowOffset ?? Offset(0, 0),
                  blurRadius: widget.shadowBlur,
                )
              ]
            : null,
        shape: shape);
    return decoration;
  }
}

class FSearchController {
  _FSearchState _state;

  String _text;

  String get text => (_state?.controller?.value?.text) ?? null;

  set text(String value) {
    if (_text != value) {
      _text = value;
      _state?.controller?.text = _text;
    }
  }

  String get hint => (_state?.hint) ?? null;

  bool get focus => (_state?.focusNode?.hasFocus) ?? false;

  ValueChanged<bool> _focusListener;

  VoidCallback _listener;

  setListener(VoidCallback listener) {
    _listener = listener;
  }

  setOnFocusChangedListener(ValueChanged<bool> listener) {
    _focusListener = listener;
  }

  dispose() {
    _state = null;
  }
}

/// 边角。
///
/// Corner
class FSearchCorner {
  final double leftTopCorner;
  final double rightTopCorner;
  final double rightBottomCorner;
  final double leftBottomCorner;

  /// 指定每一个圆角的大小
  ///
  /// Specify the size of each rounded corner
  const FSearchCorner({
    this.leftTopCorner = 0,
    this.rightTopCorner = 0,
    this.rightBottomCorner = 0,
    this.leftBottomCorner = 0,
  });

  /// 设置所有圆角为一个大小
  ///
  /// Set all rounded corners to one size
  FSearchCorner.all(double radius)
      : leftTopCorner = radius,
        rightTopCorner = radius,
        rightBottomCorner = radius,
        leftBottomCorner = radius;
}

/// 边角风格。
/// [round] - 圆角
/// [bevel] - 斜角
///
/// Rounded corner style.
/// [round]-rounded corners
/// [bevel]-beveled corners
enum FSearchCornerStyle {
  round,
  bevel,
}
