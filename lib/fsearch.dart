import 'dart:async';

import 'package:flutter/material.dart';

/// [hint] 交换动画类型
///
/// [hint] Swap animation types
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

/// [FSearch] 用于处理搜索模块。支持边框、边角、背景等诸多配置效果。支持不同风格的多 [hint] 切换动画。
///
/// [FSearch] is used to process the search module. Support many configuration effects such as border, corner, background and so on.
/// Support multiple [hint] switching animations of different styles.
class FSearch extends StatefulWidget {
  /// 详见 [FSearchController]
  ///
  /// See [FSearchController] for details
  final FSearchController controller;

  final double width;

  final double height;

  final String text;

  final ValueChanged<String> onSearch;

  final FSearchCorner corner;

  final Color strokeColor;

  final double strokeWidth;

  final FSearchCornerStyle cornerStyle;

  final Color backgroundColor;

  final Gradient gradient;

  final double shadowBlur;

  final Color shadowColor;

  final Offset shadowOffset;

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
    this.onSearch,
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
  int scrollHintCurrentIndex = 0;
  double inputHeight;
  double inputWidth;
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
      int index = hintIndex + 1;
      if (index > -1 && index < widget.hints.length) {
        r = widget.hints[index];
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
    ///
    /// Input monitor
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
    ///
    /// Initialize text for the first time
    if (widget.controller != null && widget.text != null) {
      widget.controller.text = widget.text;
    } else if (widget.text != null) {
      controller.text = widget.text;
    }

    /// 焦点监听
    ///
    /// Focus monitoring
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
    if (widget.hintSwitchType == FSearchAnimationType.Scroll &&
        scrollAnimPlaying) {
      scrollAnimPlaying = false;
      if (scrollHintCurrentIndex == 0) {
        setState(() {
          hintSwitchTop_0 = 0;
          hintSwitchTop_1 = inputHeight;
        });
      } else {
        setState(() {
          hintSwitchTop_0 = inputHeight;
          hintSwitchTop_1 = 0;
        });
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
//      padding: widget.padding,
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
          inputHeight != box.size.height) {
        setState(() {
          inputHeight = box.size.height;
          inputWidth = box.size.width;
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
      onSubmitted: widget.onSearch,
    );
    children.add(textField);

    if (showHint) {
      if (widget.hintSwitchEnable && inputHeight != null) {
        int index = hintIndex == -1 ? 0 : hintIndex;
        if (widget.hintSwitchType == FSearchAnimationType.Fade) {
          Widget hintSwitcher = buildFadeSwitcher();
          children.add(hintSwitcher);
        } else if (widget.hintSwitchType == FSearchAnimationType.Scale) {
          Widget hintSwitcher = buildScaleSwitcher();
          children.add(hintSwitcher);
        } else {
          /// 滚动动画
          ///
          /// transition anim
          Widget hintSwitch_0 = buildScrollSwitch_1();
          Widget hintSwitch_1 = buildScrollSwitch_2();
          children.add(hintSwitch_0);
          children.add(hintSwitch_1);
        }
      } else if (widget.hints != null && widget.hints.length > 0) {
        children.add(buildNormalHint());
      }
    }

    return Container(
      padding: widget.padding,
      child: Stack(
        alignment: widget.center ? Alignment.center : Alignment.centerLeft,
        children: children,
      ),
    );
  }

  Widget buildNormalHint() {
    TextStyle style = widget.style ?? buildDefaultTextStyle();
    List<Widget> children = [];
    if (widget.hintPrefix != null) {
      children.add(widget.hintPrefix);
    }
    children.add(LimitedBox(
      maxWidth: inputWidth ?? 0.0,
      child: Text(
        widget.hints[0],
        style: widget.hintStyle ??
            style.copyWith(
              color: Colors.grey,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    ));
    return IgnorePointer(
      child: Container(
        width: inputWidth,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }

  AnimatedPositioned buildScrollSwitch_2() {
    TextStyle style = widget.style ?? buildDefaultTextStyle();
    return AnimatedPositioned(
      top: hintSwitchTop_1,
      child: IgnorePointer(
        child: LimitedBox(
          maxWidth: inputWidth ?? 0.0,
          child: Container(
            height: inputHeight,
            width: inputWidth,
            alignment: widget.center ? Alignment.center : Alignment.centerLeft,
            child: Text(
              hint_1,
              style: widget.hintStyle ??
                  style.copyWith(
                    color: Colors.grey,
                  ),
              overflow: TextOverflow.ellipsis,
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
  }

  Widget buildScrollSwitch_1() {
    TextStyle style = widget.style ?? buildDefaultTextStyle();
    return AnimatedPositioned(
      top: hintSwitchTop_0,
      child: IgnorePointer(
        child: LimitedBox(
          maxWidth: inputWidth ?? 0.0,
          child: Container(
            height: inputHeight,
            alignment: widget.center ? Alignment.center : Alignment.centerLeft,
            child: Text(
              hint_0,
              style: widget.hintStyle ??
                  style.copyWith(
                    color: Colors.grey,
                  ),
              overflow: TextOverflow.ellipsis,
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
  }

  Widget buildScaleSwitcher() {
    int index = hintIndex == -1 ? 0 : hintIndex;
    TextStyle style = widget.style ?? buildDefaultTextStyle();
    return AnimatedSwitcher(
      child: IgnorePointer(
        key: ValueKey(index),
        child: Container(
          alignment: widget.center ? Alignment.center : Alignment.centerLeft,
          height: inputHeight,
          child: Text(
            widget.hints[index],
            style: widget.hintStyle ??
                style.copyWith(
                  color: Colors.grey,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      duration: widget.hintSwitchAnimDuration,
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
        alignment: widget.center ? Alignment.center : Alignment.centerLeft,
      ),
    );
  }

  Widget buildFadeSwitcher() {
    int index = hintIndex == -1 ? 0 : hintIndex;
    TextStyle style = widget.style ?? buildDefaultTextStyle();
    Widget hintSwitcher = AnimatedSwitcher(
      child: IgnorePointer(
        key: ValueKey(index),
        child: Container(
          height: inputHeight,
          alignment: widget.center ? Alignment.center : Alignment.centerLeft,
          child: Text(
            widget.hints[index],
            style: widget.hintStyle ??
                style.copyWith(
                  color: Colors.grey,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      duration: widget.hintSwitchAnimDuration,
    );
    return hintSwitcher;
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
          if (hintSwitchTop_0 == 0) {
            scrollHintCurrentIndex = 0;
          }
          hintSwitchTop_1 = switchHintTop(hintSwitchTop_1);
          if (hintSwitchTop_1 == 0) {
            scrollHintCurrentIndex = 1;
          }
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
    Decoration decoration = ShapeDecoration(
        color: widget.gradient == null ? widget.backgroundColor : null,
        gradient: widget.gradient,
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

  String get text => (_state?.controller?.value?.text) ?? null;

  set text(String value) {
    if (_state?.controller?.text != value) {
      _state?.controller?.clear();
      _state?.controller?.text = value;
      _state?.controller?.selection =
          TextSelection.collapsed(offset: value?.length ?? 0);
      _listener?.call();
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

  requestFocus() {
    _state?.focusNode?.requestFocus();
  }

  clearFocus() {
    _state?.focusNode?.unfocus();
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
