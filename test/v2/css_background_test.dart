import 'package:aipictors/v2/core/css_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('colors', () {
    expect(parseCssColor('#ff97bc'), const Color(0xFFFF97BC));
    expect(parseCssColor('#abc'), const Color(0xFFAABBCC));
    expect(parseCssColor('#ff97bc80'), const Color(0x80FF97BC));
    expect(parseCssColor('rgba(255, 0, 0, 0.5)')!.a, closeTo(0.5, 0.01));
    expect(parseCssColor('rgb(255 0 0 / 50%)')!.a, closeTo(0.5, 0.01));
    expect(parseCssColor('hsl(0, 100%, 50%)'), const Color(0xFFFF0000));
    expect(parseCssColor('nope'), isNull);
  });

  test('conic: production rainbow frame', () {
    final bg = CssBackground.parse('conic-gradient(from 180deg at 50% 50%, #ff97bc 0deg, #ffd96d 72deg, #92f0c9 148deg, #84bbff 230deg, #d2a2ff 300deg, #ff97bc 360deg)');
    final g = bg.layers.single.gradient as SweepGradient;
    expect(g.colors.length, 6);
    expect(g.stops![1], closeTo(0.2, 0.001));
    expect(g.stops!.last, 1);
    expect((g.transform as GradientRotation).radians, closeTo(1.5708, 0.001));
  });

  test('linear: angle and implied stops', () {
    final g = CssBackground.parse('linear-gradient(90deg, red, blue 50%, white)').layers.single.gradient as LinearGradient;
    expect((g.begin as Alignment).x, closeTo(-1, 0.001));
    expect((g.end as Alignment).x, closeTo(1, 0.001));
    expect(g.stops, [0, 0.5, 1]);
    final side = CssBackground.parse('linear-gradient(to bottom, #000, #fff)').layers.single.gradient as LinearGradient;
    expect((side.end as Alignment).y, closeTo(1, 0.001));
    final corner = CssBackground.parse('linear-gradient(135deg, #000, #fff)').layers.single.gradient as LinearGradient;
    expect((corner.end as Alignment).x, closeTo(1, 0.001));
    expect((corner.end as Alignment).y, closeTo(1, 0.001));
  });

  test('radial and layers', () {
    final bg = CssBackground.parse('radial-gradient(circle at 25% 25%, rgba(255,255,255,0.5), transparent 60%), linear-gradient(#000, #fff)');
    expect(bg.layers.length, 2);
    expect(bg.layers.first.gradient, isA<LinearGradient>());
    final r = bg.layers.last.gradient as RadialGradient;
    expect((r.center as Alignment).x, closeTo(-0.5, 0.001));
    expect(r.stops, [0, 0.6]);
  });

  test('solid and garbage', () {
    expect(CssBackground.parse('#fff').layers.single.color, const Color(0xFFFFFFFF));
    expect(CssBackground.parse('url(x.png)').isEmpty, isTrue);
    expect(CssBackground.parse(null).isEmpty, isTrue);
  });
}
