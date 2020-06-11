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

## 📺 使用示例

### 🔩 Base Demo

![](https://gw.alicdn.com/tfs/TB1QSOkJYr1gK0jSZR0XXbP8XXa-320-469.gif)

```dart
FSearch(
  color: color,
  width: 160.0,
  strokeWidth: 2.0,
  dottedLength: 10.0,
  space: 2.0,
)
```

### 🌖 Prefixes & Suffixes

![](https://gw.alicdn.com/tfs/TB1fWytJYj1gK0jSZFuXXcrHpXa-320-469.gif)



### 🌈 Gradient

![](https://gw.alicdn.com/tfs/TB1dh1sJ7T2gK0jSZFkXXcIQFXa-320-469.gif)



### 🍄 Corner & Stroke & Shadow

![](https://gw.alicdn.com/tfs/TB1XrOdJ1L2gK0jSZPhXXahvXXa-320-464.gif)


### 📍 Cursor

![](https://gw.alicdn.com/tfs/TB1x4CmJVP7gK0jSZFjXXc5aXXa-320-464.gif)


### 🗂 Hint

![](https://gw.alicdn.com/tfs/TB1iFAMXI4z2K4jSZKPXXXAYpXa-360-466.gif)

### 💻 Controller

![](https://gw.alicdn.com/tfs/TB1Pt1oJYY1gK0jSZTEXXXDQVXa-360-298.gif)



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
