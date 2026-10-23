import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsearch/fsearch.dart';

void main() {
  testWidgets('single hint should be visible (issue #9)', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: FSearch(
            width: 300,
            height: 36,
            hints: ['请输入讲师姓名搜索'],
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    final RenderBox hintBox =
        tester.renderObject(find.text('请输入讲师姓名搜索'));
    expect(hintBox.size.width, greaterThan(0));
    expect(hintBox.size.height, greaterThan(0));
  });

  testWidgets('multiple hints switch animation still works', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: FSearch(
            width: 300,
            height: 36,
            hints: ['hint 0', 'hint 1'],
            hintSwitchEnable: true,
          ),
        ),
      ),
    ));
    // 让 postFrameCallback 完成输入区域测量并构建切换组件
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('hint 0'), findsOneWidget);
    final RenderBox hintBox = tester.renderObject(find.text('hint 0'));
    expect(hintBox.size.width, greaterThan(0));
  });

  testWidgets('FSearchCorner leftTopCorner takes effect (issue #9)',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: FSearch(
            width: 300,
            height: 36,
            corner: FSearchCorner(
              leftTopCorner: 18,
              rightTopCorner: 18,
              leftBottomCorner: 18,
              rightBottomCorner: 18,
            ),
          ),
        ),
      ),
    ));

    final Container container = tester.widget(
      find
          .descendant(of: find.byType(FSearch), matching: find.byType(Container))
          .first,
    );
    final ShapeDecoration decoration =
        container.decoration as ShapeDecoration;
    final RoundedRectangleBorder shape =
        decoration.shape as RoundedRectangleBorder;
    final BorderRadius borderRadius = shape.borderRadius as BorderRadius;
    expect(borderRadius.topLeft, const Radius.circular(18));
    expect(borderRadius.topRight, const Radius.circular(18));
    expect(borderRadius.bottomLeft, const Radius.circular(18));
    expect(borderRadius.bottomRight, const Radius.circular(18));
  });
}
