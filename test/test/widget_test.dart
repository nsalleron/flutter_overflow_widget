// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:golden_test_and_expandable/main.dart';

void main() {

  const devicesList =[
    Device.phone,
    Device.iphone11,
    Device.tabletPortrait,
    Device.tabletLandscape,
  ];

  group("GoldenTests", () {
    devicesList.forEach((element) {
      testWidgets('Golden test', (WidgetTester tester) async {
        await tester.setScreenSize(element.size);
        await tester.pumpWidget(MyApp());
        await expectLater(find.byType(MyApp), matchesGoldenFile('goldens/${element.name}.png'));
      });
    });

  });


}
extension SetScreenSize on WidgetTester {
  Future<void> setScreenSize(Size size, {double pixelDensity = 1.0}) async {
    await this.binding.setSurfaceSize(size);
    this.binding.window.physicalSizeTestValue = size;
    this.binding.window.devicePixelRatioTestValue = pixelDensity;
  }
}