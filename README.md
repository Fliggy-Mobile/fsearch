<p align="center">
  <a href="https://github.com/Fliggy-Mobile">
    <img width="200" src="https://gw.alicdn.com/tfs/TB1a288sxD1gK0jSZFKXXcJrVXa-360-360.png">
  </a>
</p>

<h1 align="center">fsearch</h1>


<div align="center">

<p>用最简单的方式来创建虚线视图吧 👀 ！</p>

<p>[FSearch] 为开发者提供了创建虚线的能力。同时支持为一个 [Widget] 创建虚线边框。支持控制虚线的粗细，间距，以及虚线边框的边角。</p>

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


<p align="center">
  <a href="https://github.com/Fliggy-Mobile">
    <img height="720" src="https://gw.alicdn.com/tfs/TB182cqI.z1gK0jSZLeXXb9kVXa-1380-1282.png">
  </a>
</p>

**[English](https://github.com/Fliggy-Mobile/fsearch) | 简体中文**

> 感觉还不错？请投出您的 **Star** 吧 🥰 ！

# ✨ 特性

- 同时支持水平、垂直两个方向的虚线



# 🛠 使用指南


## ⚙️ 参数 & 接口

### 🔩 FSearch 参数

|参数|类型|必要|默认值|说明|
|---|---|:---:|---|---|
|color|Color|false|`Colors.black`|虚线颜色|



## 📺 使用示例

### 🔩 Horizontal Demo

![](https://gw.alicdn.com/tfs/TB1ClEbI5_1gK0jSZFqXXcpaXXa-360-340.png)

```dart
FSearch(
  color: color,
  width: 160.0,
  strokeWidth: 2.0,
  dottedLength: 10.0,
  space: 2.0,
)
```


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
