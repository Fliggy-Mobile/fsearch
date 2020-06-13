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
  /// 控制器。详见 [FSearchController]
  ///
  /// Controller.See [FSearchController] for details
  final FSearchController controller;

  /// 宽。
  ///
  /// Width
  final double width;

  /// 高
  ///
  /// Height
  final double height;

  /// 是否可用
  ///
  /// enable
  final bool enable;

  /// 当输入框被点击时会回调
  ///
  /// Callback when the input box is clicked
  final VoidCallback onTap;

  /// 输入内容
  ///
  /// input content
  final String text;

  /// 当点击键盘搜索按钮时会回调
  ///
  /// Callback when the keyboard search button is clicked
  final ValueChanged<String> onSearch;

  /// 边角效果。详见 [FSearchCorner]
  ///
  /// Corner effect. See [FSearchCorner] for details
  final FSearchCorner corner;

  /// 边角风格。默认 [FSearchCornerStyle.round]。详见 [FSearchCornerStyle]
  ///
  /// Corner style. The default [FSearchCornerStyle.round]. See [FSearchCornerStyle] for details
  final FSearchCornerStyle cornerStyle;

  /// 边框颜色
  ///
  /// stroke color
  final Color strokeColor;

  /// 边框宽
  ///
  /// stroke width
  final double strokeWidth;

  /// 背景颜色
  ///
  /// background color
  final Color backgroundColor;

  /// 背景渐变色。会覆盖 [backgroundColor]
  ///
  /// Background gradient. Will overwrite [backgroundColor]
  final Gradient gradient;

  /// 设置组件阴影颜色
  ///
  /// Set component shadow color
  final Color shadowColor;

  /// 设置组件阴影偏移
  ///
  /// Set component shadow offset
  final Offset shadowOffset;

  /// 设置组件高斯与阴影形状卷积的标准偏差。
  ///
  /// Sets the standard deviation of the component's Gaussian convolution with the shadow shape.
  final double shadowBlur;

  /// 光标颜色
  ///
  /// Cursor color
  final Color cursorColor;

  /// 光标宽
  ///
  /// cursor width
  final double cursorWidth;

  /// 光标边角大小
  ///
  /// Cursor corner size
  final double cursorRadius;

  /// 前缀动作按钮
  ///
  /// Prefix action button
  final List<Widget> prefixes;

  /// 后缀动作按钮
  ///
  /// Suffix action button
  final List<Widget> suffixes;

  /// 实际输入区域与 [FSearch] 边缘的间距
  ///
  /// The distance between the actual input area and the edge of [FSearch]
  final EdgeInsets padding;

  /// [FSearch] 的外间距
  ///
  /// [FSearch] outer spacing
  final EdgeInsets margin;

  /// 输入文本风格
  ///
  /// Input text style
  final TextStyle style;

  /// Hint 文本风格
  ///
  /// Hint text style
  final TextStyle hintStyle;

  /// Hint。如果只有一条 Hint，将无法启用 Hint 交换动画。
  ///
  /// Hint. If there is only one Hint, Hint swap animation cannot be enabled.
  final List<String> hints;

  /// Hint 交换时间间隔
  ///
  /// Hint exchange interval
  final Duration hintSwitchDuration;

  /// Hint 交换动画时间
  ///
  /// Hint swap animation time
  final Duration hintSwitchAnimDuration;

  /// 是否启用 Hint 交换动画
  ///
  /// Whether to enable Hint swap animation
  final bool hintSwitchEnable;

  /// Hint 交换动画类型。默认 [FSearchAnimationType.Scroll]。详见 [FSearchAnimationType]。
  ///
  /// Hint exchanges animation types. The default [FSearchAnimationType.Scroll]. See [FSearchAnimationType] for details.
  final FSearchAnimationType hintSwitchType;

  /// 当获得焦点时，是否自动停止 Hint 交换动画。默认 true。
  ///
  /// When the focus is obtained, whether to automatically stop the Hint exchange animation. The default is true.
  final bool stopHintSwitchOnFocus;

  /// Hint 前缀小部件
  ///
  /// Hint prefix widget
  final Widget hintPrefix;

  /// 是否居中。
  ///
  /// Is it centered
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
    this.enable = true,
    this.onTap,
  }) : super(key: key);

  @override
  _FSearchState createState() => _FSearchState();
}

class _FSearchState extends State<FSearch> {
  String hint_0;
  String hint_1;
  int nextHintIndex = -1;
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
      int index = nextHintIndex + 1;
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
            tryToFixScrollAnim();
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

  void tryToFixScrollAnim() {
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
    initInputSize();
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

  void initInputSize() {
//    if (inputHeight != null) return;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      RenderBox box = inputKey.currentContext?.findRenderObject();
      if (widget.hints != null &&
          widget.hints.length > 1 &&
          inputHeight != box.size.height &&
          inputWidth != box.size.width) {
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
      key: inputKey,
      focusNode: focusNode,
      controller: controller,
      textAlign: widget.center ? TextAlign.center : TextAlign.start,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration.collapsed(hintText: ""),
      style: style,
      cursorColor: widget.cursorColor,
      cursorWidth: widget.cursorWidth,
      cursorRadius: Radius.circular(widget.cursorRadius),
      onSubmitted: widget.onSearch,
      onTap: () {
        widget.onTap?.call();
        if (!widget.enable) {
          focusNode.unfocus();
        }
      },
    );
    children.add(textField);

    if (showHint) {
      if (widget.hintSwitchEnable && inputHeight != null) {
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
    Widget child = Text(
      hint_1,
      style: widget.hintStyle ?? style.copyWith(color: Colors.grey),
      overflow: TextOverflow.ellipsis,
    );
    return AnimatedPositioned(
      top: hintSwitchTop_1,
      child: IgnorePointer(
        child: LimitedBox(
          maxWidth: inputWidth ?? 0.0,
          child: Container(
            height: inputHeight,
            width: inputWidth,
            alignment: widget.center ? Alignment.center : Alignment.centerLeft,
            child: child,
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
    Widget child = Text(
      hint_0,
      style: widget.hintStyle ?? style.copyWith(color: Colors.grey),
      overflow: TextOverflow.ellipsis,
    );
    return AnimatedPositioned(
      top: hintSwitchTop_0,
      child: IgnorePointer(
        child: LimitedBox(
          maxWidth: inputWidth ?? 0.0,
          child: Container(
            height: inputHeight,
            alignment: widget.center ? Alignment.center : Alignment.centerLeft,
            child: child,
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
    int index = nextHintIndex == -1 ? 0 : nextHintIndex;
    TextStyle style = widget.style ?? buildDefaultTextStyle();
    Widget child = Text(
      widget.hints[index],
      style: widget.hintStyle ?? style.copyWith(color: Colors.grey),
      overflow: TextOverflow.ellipsis,
    );
    return AnimatedSwitcher(
      child: IgnorePointer(
        key: ValueKey(index),
        child: Container(
          alignment: widget.center ? Alignment.center : Alignment.centerLeft,
          height: inputHeight,
          child: child,
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
    int index = nextHintIndex == -1 ? 0 : nextHintIndex;
    TextStyle style = widget.style ?? buildDefaultTextStyle();
    Widget child = Text(
      widget.hints[index],
      style: widget.hintStyle ?? style.copyWith(color: Colors.grey),
      overflow: TextOverflow.ellipsis,
    );
    Widget hintSwitcher = AnimatedSwitcher(
      child: IgnorePointer(
        key: ValueKey(index),
        child: Container(
          height: inputHeight,
          alignment: widget.center ? Alignment.center : Alignment.centerLeft,
          child: child,
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
    switchTimer?.cancel();
    switchTimer = Timer(widget.hintSwitchDuration, () {
      if (!mounted &&
          showHint &&
          widget.hintSwitchEnable &&
          inputHeight != null) return;
      List<String> hints = widget.hints;
      if (widget.hintSwitchType != FSearchAnimationType.Scroll) {
        setState(() {
          nextHintIndex =
              (nextHintIndex + 1 == hints.length ? 0 : nextHintIndex + 1);
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
          if (hintSwitchTop_0 == hintSwitchTop_1) tryToFixScrollAnim();
          nextHintIndex =
              (nextHintIndex + 1 == hints.length ? 0 : nextHintIndex + 1);
          int nextIndex =
              (nextHintIndex + 1 == hints.length ? 0 : nextHintIndex + 1);
          if (hintSwitchTop_0 == inputHeight) {
            hint_0 = hints[nextIndex];
          } else {
            hint_0 = hints[nextHintIndex];
          }
          if (hintSwitchTop_1 == inputHeight) {
            hint_1 = hints[nextIndex];
          } else {
            hint_1 = hints[nextHintIndex];
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

/// [FSearch] 的控制器，能够回去到输入的文本、Hint、焦点状态等信息。同时提供各种监听和文本更新能力。
///
/// The controller of [FSearch] can go back to the input text, Hint, focus status and other information.
/// At the same time provide a variety of monitoring and text update capabilities.
class FSearchController {
  _FSearchState _state;

  /// 输入的文本内容
  ///
  /// input text
  String get text => (_state?.controller?.value?.text) ?? null;

  /// 主动更新输入文本
  ///
  /// Actively update input text
  set text(String value) {
    if (_state?.controller?.text != value) {
      _state?.controller?.clear();
      _state?.controller?.text = value;
      _state?.controller?.selection =
          TextSelection.collapsed(offset: value?.length ?? 0);
      _listener?.call();
    }
  }

  /// 当前 Hint 内容
  ///
  /// Current Hint content
  String get hint => (_state?.hint) ?? null;

  /// 焦点状态
  ///
  /// Focus state
  bool get focus => (_state?.focusNode?.hasFocus) ?? false;

  ValueChanged<bool> _focusListener;

  VoidCallback _listener;

  /// 设置输入监听
  ///
  /// Set input listener
  setListener(VoidCallback listener) {
    _listener = listener;
  }

  /// 设置焦点变化监听
  ///
  /// set focus changed listener
  setOnFocusChangedListener(ValueChanged<bool> listener) {
    _focusListener = listener;
  }

  /// 请求获得焦点
  ///
  /// request focus
  requestFocus() {
    _state?.focusNode?.requestFocus();
  }

  /// 移除焦点
  ///
  /// clear focus
  clearFocus() {
    _state?.focusNode?.unfocus();
  }

  /// 销毁
  ///
  /// destroy
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
