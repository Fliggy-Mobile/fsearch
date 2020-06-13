<p align="center">
  <a href="https://github.com/Fliggy-Mobile">
    <img width="200" src="https://gw.alicdn.com/tfs/TB1a288sxD1gK0jSZFKXXcJrVXa-360-360.png">
  </a>
</p>

<h1 align="center">fsearch</h1>


<div align="center">

<p>Help developers build the most beautiful search bar🍹.</p>

<p>[FSearch] provides developers with a one-stop search bar construction service. Supports borders, corners, gradient background colors and shadows, as well as any number of prefix and suffix action buttons. Provides beautiful Hint animation.</p>

<p><strong>Author：<a href="https://github.com/chenBingX">Newton</a>(<a href="coorchice.cb@alibaba-inc.com">coorchice.cb@alibaba-inc.com</a>)</strong></p>

<p>

<a href="https://pub.dev/packages/fsearch#-readme-tab-">
    <img height="20" src="https://img.shields.io/badge/Version-1.0.1-important.svg">
</a>


<a href="https://github.com/Fliggy-Mobile/fsearch">
    <img height="20" src="https://img.shields.io/badge/Build-passing-brightgreen.svg">
</a>


<a href="https://github.com/Fliggy-Mobile">
    <img height="20" src="https://img.shields.io/badge/Team-FAT-ffc900.svg">
</a>

<a href="https://www.dartcn.com/">
    <img height="20" src="https://img.shields.io/badge/Language-Dart-blue.svg">
</a>

<a href="https://pub.dev/documentation/fsearch/latest/fsearch/fsearch-library.html">
    <img height="20" src="https://img.shields.io/badge/API-done-yellowgreen.svg">
</a>

<a href="http://www.apache.org/licenses/LICENSE-2.0.txt">
   <img height="20" src="https://img.shields.io/badge/License-Apache--2.0-blueviolet.svg">
</a>

<p>
<p>

</div>

||||
|:--:|:--:|:--:|
|![](https://gw.alicdn.com/tfs/TB1QSOkJYr1gK0jSZR0XXbP8XXa-320-469.gif)|![](https://gw.alicdn.com/tfs/TB1fWytJYj1gK0jSZFuXXcrHpXa-320-469.gif)|![](https://gw.alicdn.com/tfs/TB1dh1sJ7T2gK0jSZFkXXcIQFXa-320-469.gif)|
|![](https://gw.alicdn.com/tfs/TB1XrOdJ1L2gK0jSZPhXXahvXXa-320-464.gif)|![](https://gw.alicdn.com/tfs/TB1x4CmJVP7gK0jSZFjXXc5aXXa-320-464.gif)|![](https://gw.alicdn.com/tfs/TB1iFAMXI4z2K4jSZKPXXXAYpXa-360-466.gif)|
|![](https://gw.alicdn.com/tfs/TB1Pt1oJYY1gK0jSZTEXXXDQVXa-360-298.gif)|![](https://gw.alicdn.com/tfs/TB19oLDGKT2gK0jSZFvXXXnFXXa-360-212.gif)|![](https://gw.alicdn.com/tfs/TB19oLDGKT2gK0jSZFvXXXnFXXa-360-212.gif)|

**English | [简体中文](https://github.com/Fliggy-Mobile/fsearch/blob/master/README_CN.md)**

> Like it? Please cast your **Star**  🥰 ！

# ✨ Features

- Support beautiful border effect

- Provide rich corner configuration

- Support stunning gradient effects

- Provides easy to use shadow capabilities

- Support any number of prefix and suffix action buttons

- Provide colorful, flexible and powerful Hint effects

- Controllers that are easier to use for developers


# 🛠 Guide


## ⚙️ Parameter & Interface

### 🔩 FSearch Param

|Param|Type|Necessary|Default|desc|
|---|---|:---:|---|---|
|controller|FSearchController|false|null|Controller. See [FSearchController] for details|
|width|double|false|null|width|
|height|double|false|null|height|
|enable|bool|false|true|enable|
|onTap|VoidCallback|false|null|Callback when the input box is clicked|
|text|String|false|null|Input content|
|onSearch|ValueChanged<String>|false|null|Callback when the keyboard search button is clicked|
|corner|FSearchCorner|false|null|Corner effect. See [FSearchCorner] for details|
|cornerStyle|FSearchCornerStyle|false|null|Corner style. The default [FSearchCornerStyle.round]. See [FSearchCornerStyle] for details|
|strokeColor|Color|false|null|Border color|
|strokeWidth|double|false|null|border width|
|backgroundColor|Color|false|null|background color|
|gradient|Gradient|false|null|Background gradient. Will overwrite [backgroundColor]|
|shadowColor|Color|false|null|Set widget shadow color|
|shadowOffset|Offset|false|null|Set widget shadow color|
|shadowBlur|double|false|null|Set the standard deviation of the widget Gaussian and shadow shape convolution|
|cursorColor|Color|false|null|Cursor color|
|cursorWidth|double|false|null|Cursor width|
|cursorRadius|double|false|null|Cursor corner size|
|prefixes|List<Widget>|false|null|Prefix action widget|
|suffixes|List<Widget>|false|null|Suffix action widget|
|padding|EdgeInsets|false|null|The distance between the actual input area and the edge of [FSearch]|
|margin|EdgeInsets|false|null|[FSearch] outer spacing|
|style|TextStyle|false|null|Input text style|
|hintStyle|TextStyle|false|null|Hint text style|
|hints|List<String>|false|null|Hint. If there is only one Hint, Hint swap animation cannot be enabled.|
|hintSwitchDuration|Duration|false|null|Hint exchange interval|
|hintSwitchAnimDuration|Duration|false|null|Hint swap animation time|
|hintSwitchEnable|bool|false|null|Whether to enable Hint swap animation|
|hintSwitchType|FSearchAnimationType|false|null|Hint exchanges animation types. The default [FSearchAnimationType.Scroll]. See [FSearchAnimationType] for details.|
|stopHintSwitchOnFocus|bool|true|null|When the focus is obtained, whether to automatically stop the Hint exchange animation.|
|hintPrefix|Widget|false|null|Hint prefix widget|
|center|bool|false|null|Centered。|

### 💻 FSearchController

 **FSearchController** is the controller of **FSearch**, which can return to the input text, `Hint`, focus status and other information. At the same time provide a variety of monitoring and text update capabilities.


#### 🔩 Param

|Param|Type|Desc|
|---|---|---|
|text|String|Input text|
|hint|String|Current Hint text|
|focus|bool|Focus state|

#### 📲 Interface

- `setListener(VoidCallback listener)`

Set input monitor


- `setOnFocusChangedListener(ValueChanged<bool> listener)`

Set focus change monitoring


- `requestFocus()`

Request focus

- `clearFocus()`

Remove focus

### 🎥 FSearchAnimationType

 **FSearchAnimationType** Used to specify the FSearch Hint exchange animation type.

```dart
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
```

## 📺 Demo

### 🔩 Base Demo

![](https://gw.alicdn.com/tfs/TB1QSOkJYr1gK0jSZR0XXbP8XXa-320-469.gif)

```dart
FSearch(

  /// 设置高
  ///
  /// Set height
  height: 30.0,
  
  /// 设置背景颜色
  ///
  /// Set background color
  backgroundColor: color,

  /// 设置输入内容样式
  ///
  /// Set input text style
  style: style,

  /// 点击键盘搜索时触发
  ///
  /// Fired when you click on the keyboard to search
  onSearch: (value) {
    /// do something
  },

  prefixes: [buildAction()],
)
```

Using **FSearch** to build a search bar is very relaxing.

Through some simple parameters, developers can easily change the size, color, and font of the search bar.

When the user clicks on the keyboard to search for **Action**, onSearch will be triggered, allowing the developer to perform some search operations here.


### 🌖 Prefixes & Suffixes

![](https://gw.alicdn.com/tfs/TB1fWytJYj1gK0jSZFuXXcrHpXa-320-469.gif)

```dart
FSearch(
  height: 30.0,
  backgroundColor: mainBackgroundColor,
  style: style,

  /// 前缀 Widget
  ///
  /// prefix widget
  prefixes: [ buildAction() ],

  /// 后缀 Widget
  ///
  /// suffix widget
  suffixes: [
    buildAction_1(),
    buildAction_2(),
    buildAction_3(),
  ],
  onSearch: _onSearch,
)
```

In FSearch, developers can configure any number of prefix or suffix action buttons for the search bar through the `prefixes` and `suffixes` parameters.


### 🌈 Gradient

![](https://gw.alicdn.com/tfs/TB1dh1sJ7T2gK0jSZFkXXcIQFXa-320-469.gif)

```dart
FSearch(
  height: 30.0,
  backgroundColor: mainBackgroundColor,
  style: style,

  /// 配置渐变色
  ///
  /// Set gradient
  gradient: _gradient,
  prefixes: [ buildAction() ],
)
```

**FSearch** can support developers to create a beautiful gradient search bar.

Only need to configure through the `gradient` parameter.

### 🍄 Corner & Stroke & Shadow

![](https://gw.alicdn.com/tfs/TB1XrOdJ1L2gK0jSZPhXXahvXXa-320-464.gif)

```dart

/// #1
FSearch(
  height: 30.0,
  backgroundColor: color,
  style: style,

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
  prefixes: [buildAction()],
)
```

The **Border** and **Shadow** effects of **FSearch** are the same as those of other **FWidget** members, and are simple and easy to use.

Through the `corner` parameter, developers can use **FSearchCorner** to freely control the table corner size of **FSearch**.

```dart
/// #2
FSearch(
  height: 30.0,
  backgroundColor: color,
  style: style,

  /// 边角
  ///
  /// Corner
  corner: FSearchCorner.all(6.0),

  /// 边角风格
  ///
  /// Corner style
  cornerStyle: FSearchCornerStyle.bevel,
  prefixes: [buildAction()],
)
```

If combined with `cornerStyle`, more complex and exquisite effects can be achieved.


### 📍 Cursor

![](https://gw.alicdn.com/tfs/TB1x4CmJVP7gK0jSZFjXXc5aXXa-320-464.gif)

```dart
FSearch(
  /// 光标配置
  ///
  /// Cursor
  cursorColor: Colors.red[200],
  cursorRadius: 5.0,
  cursorWidth: 5.0,

  height: 36.0,
  style: style,
  gradient: _gradient,
  corner: _corner,
  prefixes: [ buildAction() ],
  suffixes: [ buildAction() ],
)
```

**FSearch** supports modifying the cursor in the input box of the search bar. You can change it to whatever you want.



### 🗂 Hint

![](https://gw.alicdn.com/tfs/TB1iFAMXI4z2K4jSZKPXXXAYpXa-360-466.gif)


```dart
/// #1
FSearch(
  height: 36.0,
  style: style,
  color: _color,
  corner: _corner,
  prefixes: [ buildAction() ],
  suffixes: [ buildAction() ],

  /// Hints
  hints: [
    "FSuper is awesome 👍",
    "Come to use FButton",
    "You will love FSearch",
  ],

  /// 开启 hint 交换动画
  ///
  /// Turn on hint exchange animation
  hintSwitchEnable: true,

  /// 配置 hint 交换动画类型
  ///
  /// Configure hint exchange animation type
  hintSwitchType: FSearchAnimationType.Fade,
)
```

**FSearch** provides developers with a very powerful **Hint** effect.

Developers can easily set multiple **Hint** for **FSearch**, and can configure multiple **Hint** swap animations by configuring `hintSwitchEnable: true`.

When the user starts typing, Hint will be automatically hidden, and the swap animation will also be stopped.

When the content of the search input box becomes empty again, Hint will appear again, and the exchange animation will start playing.

```dart
/// #2
FSearch(
  height: 36.0,
  style: style,
  color: _color,
  corner: _corner,
  prefixes: [ buildAction() ],
  suffixes: [ buildAction1(),  buildAction2()],
  hints: [
    "Do you want to try FFloat?😃",
    "FRadio can do more 😱 !",
    "I heard that you have been waiting for FDottedLine for a long time...",
  ],
  hintSwitchEnable: true,
)
```


**FSearch** has prepared rich exchange animations for developers. By default, **FSearch** will use the most common scroll swap animation, which is `FSearchAnimationType.Scroll`.
 
Of course, developers can configure their favorite animation types through the `hintSwitchType` parameter.

> 💡 Note that when `hints.length == 1`, the Hint swap animation will not be played. Only an ordinary Hint will be displayed at this time.


```dart
/// #3
FSearch(
  height: 36.0,
  style: style,
  color: _color,
  corner: _corner,
  prefixes: [ buildAction() ],
  suffixes: [ buildAction() ],

  /// Hints
  hints: [
    "Embrace FWidget 👬",
    "We care about your app 🥰",
    "Want to build beautiful apps 🤨 ?",
  ],
  hintSwitchEnable: true,

  /// 配置 hint 交换动画类型
  ///
  /// Configure hint exchange animation type
  hintSwitchType: FSearchAnimationType.Scale,

  /// 获得焦点时是否停止交换动画
  ///
  /// Whether to stop exchanging animation when focus is obtained
  stopHintSwitchOnFocus: false,
)
```

By default, when **FSearch** gains input focus, **FSearch** will automatically pause **Hint** to swap animations; when it gets focus again, it will resume automatically.

By configuring `stopHintSwitchOnFocus: false`, you can continue to play **Hint** swap animation until the user starts typing when **FSearch** has the focus.


 
### 💻 Controller

![](https://gw.alicdn.com/tfs/TB1Pt1oJYY1gK0jSZTEXXXDQVXa-360-298.gif)

```dart
FSearch(
  controller: _controller,
  height: 36.0,
  style: style,
  gradient: _gradient,
  corner: _corner,
  prefixes: [ buildAction() ],
  suffixes: [ buildAction() ],
  hints: [
    "Want more beautiful widgets 🤨 ?",
    "We will launch the official website of FWidget",
    "Will you expect it?",
  ],
  hintStyle: hintStyle,
  hintSwitchEnable: true,
)

/// 获取输入框内容
///
/// Get the input box content
String input = controller.text;

/// 清空输入框内容
///
/// Clear the contents of the input box
controller.text = null;

/// 获取当前 hint，如果有的话
///
/// Get the current hint, if any
String hint = controller.hint;

/// 移除焦点
/// 
/// Remove focus
controller.clearFocus();


/// 获取焦点
///
/// Request focus
controller.requestFocus();
```

 **FSearch** provides developers with simple, easy-to-use, certain controllers, through which developers can modify or obtain the contents of the search bar at any location.

# 😃 How to use？

Add dependencies in the project `pubspec.yaml` file:

## 🌐 pub dependency

```
dependencies:
  fsearch: ^<version number>
```

> ⚠️ Attention，please go to [**pub**] (https://pub.dev/packages/fsearch) to get the latest version number of **FSearch**

## 🖥 Git dependency

```
dependencies:
  fsearch:
    git:
      url: 'git@github.com:Fliggy-Mobile/fsearch.git'
      ref: '<Branch number or tag number>'
```

> ⚠️ Attention，please refer to [**FSearch**] (https://github.com/Fliggy-Mobile/fsearch) official project for branch number or tag.


# 💡 License

```
Copyright 2020-present Fliggy Android Team <alitrip_android@list.alibaba-inc.com>.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at following link.

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

```


### Like it? Please cast your [**Star**](https://github.com/Fliggy-Mobile/fsearch) 🥰 ！


---

# How to run Demo project?

1. **clone** project to local

2. Enter the project `example` directory and run the following command

```
flutter create .
```

3. Run the demo in `example`
