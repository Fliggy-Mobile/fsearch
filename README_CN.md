<p align="center">
  <a href="https://github.com/Fliggy-Mobile">
    <img width="200" src="https://gw.alicdn.com/tfs/TB1a288sxD1gK0jSZFKXXcJrVXa-360-360.png">
  </a>
</p>

<h1 align="center">fsearch</h1>


<div align="center">

<p>帮助开发者构建最美的搜索栏🍹。</p>

<p>[FSearch] 为开发者提供了一站式的搜索栏构建服务。支持边框、边角、渐变背景色以及阴影，同时支持任意数量的前缀、后缀动作按钮。提供了精美的 Hint 动画。</p>

<p><strong>主理人：<a href="https://github.com/chenBingX">纽特</a>(<a href="coorchice.cb@alibaba-inc.com">coorchice.cb@alibaba-inc.com</a>)</strong></p>

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

**[English](https://github.com/Fliggy-Mobile/fsearch) | 简体中文**

> 感觉还不错？请投出您的 **Star** 吧 🥰 ！

# ✨ 特性

- 支持精美的边框效果

- 提供丰富的边角配置

- 支持惊艳的渐变效果

- 提供简单易用的阴影能力

- 支持任意数量的前缀、后缀动作按钮

- 提供丰富多彩的、灵活强大 Hint 效果

- 给开发者更易用的控制器

# 🛠 使用指南


## ⚙️ 参数 & 接口

### 🔩 FSearch 参数

|参数|类型|必要|默认值|说明|
|---|---|:---:|---|---|
|controller|FSearchController|false|null|控制器。详见 [FSearchController]|
|width|double|false|null|宽|
|height|double|false|null|高|
|text|String|false|null|输入内容|
|onSearch|ValueChanged<String>|false|null|当点击键盘搜索按钮时会回调|
|corner|FSearchCorner|false|null|边角效果。详见 [FSearchCorner]|
|cornerStyle|FSearchCornerStyle|false|null|边角风格。默认 [FSearchCornerStyle.round]。详见 [FSearchCornerStyle]|
|strokeColor|Color|false|null|边框颜色|
|strokeWidth|double|false|null|边框宽|
|backgroundColor|Color|false|null|背景颜色|
|gradient|Gradient|false|null|背景渐变色。会覆盖 [backgroundColor]|
|shadowColor|Color|false|null|设置组件阴影颜色|
|shadowOffset|Offset|false|null|设置组件阴影偏移|
|shadowBlur|double|false|null|设置组件高斯与阴影形状卷积的标准偏差|
|cursorColor|Color|false|null|光标颜色|
|cursorWidth|double|false|null|光标宽|
|cursorRadius|double|false|null|光标边角大小|
|prefixes|List<Widget>|false|null|前缀动作按钮|
|suffixes|List<Widget>|false|null|后缀动作按钮|
|padding|EdgeInsets|false|null|实际输入区域与 [FSearch] 边缘的间距|
|margin|EdgeInsets|false|null|[FSearch] 的外间距|
|style|TextStyle|false|null|输入文本风格|
|hintStyle|TextStyle|false|null|Hint 文本风格|
|hints|List<String>|false|null|Hint。如果只有一条 Hint，将无法启用 Hint 交换动画。|
|hintSwitchDuration|Duration|false|null|Hint 交换时间间隔|
|hintSwitchAnimDuration|Duration|false|null|Hint 交换动画时间|
|hintSwitchEnable|bool|false|null|是否启用 Hint 交换动画|
|hintSwitchType|FSearchAnimationType|false|null|Hint 交换动画类型。默认 [FSearchAnimationType.Scroll]。详见 [FSearchAnimationType]。|
|stopHintSwitchOnFocus|bool|true|null|当获得焦点时，是否自动停止 Hint 交换动画。|
|hintPrefix|Widget|false|null|Hint 前缀小部件|
|center|bool|false|null|是否居中。|

### 💻 FSearchController

 **FSearchController**  是  **FSearch**  的控制器，能够回去到输入的文本、 `Hint`、焦点状态等信息。同时提供各种监听和文本更新能力。


#### 🔩 参数

|参数|类型|说明|
|---|---|---|
|text|String|输入的文本内容|
|hint|String|当前 Hint 内容|
|focus|bool|焦点状态|

#### 📲 接口

- `setListener(VoidCallback listener)`

设置输入监听


- `setOnFocusChangedListener(ValueChanged<bool> listener)`

设置焦点变化监听


- `requestFocus()`

请求获得焦点

- `clearFocus()`

移除焦点

### 🎥 FSearchAnimationType

 **FSearchAnimationType** 用于指定 FSearch 的 Hint 交换动画类型。

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

## 📺 使用示例

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

使用  **FSearch**  来构建一个搜索栏是一件十分悠然自得的事。

通过一些简单的参数，开发者能够很容易去改变搜索栏的大小、颜色、字体。

当用户点击键盘的搜索  **Action**  时，会触发 `onSearch`，使得开发者可以在这里进行一些搜索操作。


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

在 FSearch 中，开发者可以通过 `prefixes` 和 `suffixes` 参数，为搜索栏分别配置任意个数的前缀或后缀动作按钮。


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

 **FSearch**  能够支持开发者创建一个漂亮的渐变色搜索栏。

只需要通过 `gradient` 参数进行配置就行。

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

 **FSearch**  的  **边框** 和 **阴影** 效果和其它的  **FWidget**  成员一样，简单易用。

通过 `corner` 参数，开发者可以使用  **FSearchCorner**  随意的控制  **FSearch**  的表边角大小。

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

如果配合  `cornerStyle`，可以实现更加复杂精美的效果。


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

 **FSearch**  支持通过对搜索栏输入框的光标进行修改。你想改成什么样，就改成什么样。



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
)
```

 **FSearch**  为开发者提供了非常强大的  **Hint**  效果。

开发者可以很容易的为  **FSearch**  设置多条  **Hint** ，而且可以通过配置 `hintSwitchEnable: true` 来开启多  **Hint**  交换动画。

当用户开始输入时，Hint 将会被自动隐藏，同时交换动画也会被停止。

当搜索输入框内容再次变为空时，Hint 将会再次出现，且开始播放交换动画。

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


**FSearch**  为开发者准备了丰富的交换动画。默认情况下， **FSearch**  会使用最常见的翻滚交换动画，即  `FSearchAnimationType.Scroll`。
 
当然，开发者可以通过 `hintSwitchType` 参数来配置自己喜欢的动画类型。

> 💡 注意，当 `hints.length == 1` 时，将不会播放 Hint 交换动画。此时仅仅会展示一个普通的 Hint。


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

默认情况下，当  **FSearch**  获得输入焦点， **FSearch**  会自动暂停  **Hint**  交换动画；再次获得焦点时，又会自动恢复。

通过配置 `stopHintSwitchOnFocus: false`，可以让  **FSearch**  获得焦点的情况下，依旧继续播放  **Hint**  交换动画，直到用户开始输入.


 
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

 **FSearch**  为开发者们提供了简单好用的、确定的控制器，通过控制器开发者可以在任意的位置对搜索栏的内容进行修改，或者获取。

# 😃 如何使用？

在项目 `pubspec.yaml` 文件中添加依赖：

## 🌐 pub 依赖方式

```
dependencies:
  fsearch: ^<版本号>
```

> ⚠️ 注意，请到 [**pub**](https://pub.dev/packages/fsearch) 获取 **FSearch** 最新版本号

## 🖥 git 依赖方式

```
dependencies:
  fsearch:
    git:
      url: 'git@github.com:Fliggy-Mobile/fsearch.git'
      ref: '<分支号 或 tag>'
```


> ⚠️ 注意，分支号 或 tag 请以 [**FSearch**](https://github.com/Fliggy-Mobile/fsearch) 官方项目为准。


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


### 感觉还不错？请投出您的 [**Star**](https://github.com/Fliggy-Mobile/fsearch) 吧 🥰 ！


---

# 如何运行 Demo 工程？

1.**clone** 工程到本地

2.进入工程 `example` 目录，运行以下命令

```
flutter create .
```

3.运行 `example` 中的 Demo
