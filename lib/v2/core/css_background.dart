import 'dart:math' as math;

import 'package:flutter/material.dart';

/// CSS の background の値（単色・linear / radial / conic-gradient）を Flutter で描ける形にする。
/// 枠の backgroundStyle は Web と同じ文字列がサーバーから来る。描くのは正方形の箱の前提。
class CssBackground {
  const CssBackground(this.layers);

  /// 下から順に重ねる層
  final List<CssLayer> layers;

  bool get isEmpty => layers.isEmpty;

  static final Map<String, CssBackground> _cache = {};

  static CssBackground parse(String? css) {
    final value = css?.trim() ?? '';
    if (value.isEmpty) return const CssBackground([]);
    return _cache.putIfAbsent(value, () {
      final parts = _splitTopLevel(value.replaceAll(RegExp(r'!important\s*$'), '').trim());
      // CSS は先に書いた層が上
      final layers = parts.reversed.map(_parseLayer).whereType<CssLayer>().toList();
      return CssBackground(layers);
    });
  }

  static CssLayer? _parseLayer(String raw) {
    final s = raw.trim();
    final open = s.indexOf('(');
    final fn = open > 0 ? s.substring(0, open).trim().toLowerCase() : '';
    if (fn.endsWith('-gradient') && s.endsWith(')')) {
      final args = _splitTopLevel(s.substring(open + 1, s.length - 1));
      switch (fn) {
        case 'linear-gradient':
          return _linear(args);
        case 'radial-gradient':
          return _radial(args);
        case 'conic-gradient':
          return _conic(args);
      }
      return null;
    }
    final color = parseCssColor(s);
    return color == null ? null : CssLayer(color: color);
  }

  static CssLayer? _linear(List<String> args) {
    var angle = 180.0;
    var rest = args;
    final first = args.isEmpty ? '' : args.first.trim().toLowerCase();
    if (first.startsWith('to ')) {
      angle = _sideAngle(first);
      rest = args.sublist(1);
    } else if (_parseAngle(first) != null) {
      angle = _parseAngle(first)!;
      rest = args.sublist(1);
    }
    final stops = _parseStops(rest, turnIsPercent: false);
    if (stops == null) return null;
    // 0deg が上、時計回り。正方形なら線の長さは |sin| + |cos|（Alignment の単位）
    final rad = angle * math.pi / 180;
    final dx = math.sin(rad);
    final dy = -math.cos(rad);
    final length = dx.abs() + dy.abs();
    return CssLayer(
      gradient: LinearGradient(
        begin: Alignment(-dx * length, -dy * length),
        end: Alignment(dx * length, dy * length),
        colors: stops.colors,
        stops: stops.positions,
      ),
    );
  }

  static CssLayer? _radial(List<String> args) {
    var rest = args;
    var center = const Offset(0.5, 0.5);
    var extent = 'farthest-corner';
    final first = args.isEmpty ? '' : args.first.trim().toLowerCase();
    if (parseCssColor(first.split(RegExp(r'\s+')).first) == null) {
      rest = args.sublist(1);
      final at = first.indexOf(' at ');
      final shape = at >= 0 ? first.substring(0, at) : (first.startsWith('at ') ? '' : first);
      if (first.startsWith('at ')) center = _parsePosition(first.substring(3));
      if (at >= 0) center = _parsePosition(first.substring(at + 4));
      for (final word in shape.split(RegExp(r'\s+'))) {
        if (word.startsWith('closest-') || word.startsWith('farthest-')) extent = word;
      }
    }
    final stops = _parseStops(rest, turnIsPercent: false);
    if (stops == null) return null;
    return CssLayer(
      gradient: RadialGradient(
        center: Alignment(center.dx * 2 - 1, center.dy * 2 - 1),
        radius: _radialExtent(center, extent),
        colors: stops.colors,
        stops: stops.positions,
      ),
    );
  }

  static double _radialExtent(Offset c, String extent) {
    final nearX = math.min(c.dx, 1 - c.dx);
    final nearY = math.min(c.dy, 1 - c.dy);
    final farX = math.max(c.dx, 1 - c.dx);
    final farY = math.max(c.dy, 1 - c.dy);
    switch (extent) {
      case 'closest-side':
        return math.min(nearX, nearY);
      case 'farthest-side':
        return math.max(farX, farY);
      case 'closest-corner':
        return math.sqrt(nearX * nearX + nearY * nearY);
      default:
        return math.sqrt(farX * farX + farY * farY);
    }
  }

  static CssLayer? _conic(List<String> args) {
    var rest = args;
    var from = 0.0;
    var center = const Offset(0.5, 0.5);
    final first = args.isEmpty ? '' : args.first.trim().toLowerCase();
    if (first.startsWith('from ') || first.startsWith('at ')) {
      rest = args.sublist(1);
      final m = RegExp(r'from\s+(\S+)').firstMatch(first);
      if (m != null) from = _parseAngle(m.group(1)!) ?? 0;
      final at = first.indexOf('at ');
      if (at >= 0) center = _parsePosition(first.substring(at + 3));
    }
    final stops = _parseStops(rest, turnIsPercent: true);
    if (stops == null) return null;
    // SweepGradient は 3 時の方向から始まるので、12 時から始まる CSS に合わせて 90 度戻す
    return CssLayer(
      gradient: SweepGradient(
        center: Alignment(center.dx * 2 - 1, center.dy * 2 - 1),
        colors: stops.colors,
        stops: stops.positions,
        transform: GradientRotation((from - 90) * math.pi / 180),
      ),
    );
  }

  static double _sideAngle(String to) {
    final top = to.contains('top');
    final bottom = to.contains('bottom');
    final left = to.contains('left');
    final right = to.contains('right');
    if (top && right) return 45;
    if (bottom && right) return 135;
    if (bottom && left) return 225;
    if (top && left) return 315;
    if (top) return 0;
    if (right) return 90;
    if (left) return 270;
    return 180;
  }

  static double? _parseAngle(String s) {
    final m = RegExp(r'^(-?[\d.]+)(deg|turn|rad|grad)$').firstMatch(s.trim());
    if (m == null) return null;
    final v = double.tryParse(m.group(1)!);
    if (v == null) return null;
    switch (m.group(2)) {
      case 'turn':
        return v * 360;
      case 'rad':
        return v * 180 / math.pi;
      case 'grad':
        return v * 0.9;
      default:
        return v;
    }
  }

  static Offset _parsePosition(String s) {
    final words = s.trim().split(RegExp(r'\s+'));
    double? x;
    double? y;
    double? read(String w) => w.endsWith('%') ? (double.tryParse(w.substring(0, w.length - 1)) ?? 50) / 100 : null;
    for (final w in words) {
      switch (w) {
        case 'left':
          x = 0;
        case 'right':
          x = 1;
        case 'top':
          y = 0;
        case 'bottom':
          y = 1;
        case 'center':
          break;
        default:
          final v = read(w);
          if (v != null) {
            if (x == null) {
              x = v;
            } else {
              y = v;
            }
          }
      }
    }
    return Offset(x ?? 0.5, y ?? 0.5);
  }

  static _Stops? _parseStops(List<String> args, {required bool turnIsPercent}) {
    final colors = <Color>[];
    final positions = <double?>[];
    for (final arg in args) {
      final tokens = _splitWords(arg.trim());
      if (tokens.isEmpty) continue;
      final color = parseCssColor(tokens.first);
      if (color == null) continue;
      final at = tokens.skip(1).map((t) => _parseStopPosition(t, turnIsPercent)).toList();
      if (at.isEmpty) {
        colors.add(color);
        positions.add(null);
      }
      for (final p in at) {
        colors.add(color);
        positions.add(p);
      }
    }
    if (colors.isEmpty) return null;
    if (colors.length == 1) {
      return _Stops([colors.first, colors.first], const [0, 1]);
    }
    // 位置の省略は CSS と同じ。両端は 0 / 1、間は等分、前より小さければ前に揃える
    positions[0] ??= 0;
    positions[positions.length - 1] ??= 1;
    var last = positions[0]!;
    for (var i = 1; i < positions.length; i++) {
      final p = positions[i];
      if (p != null) {
        if (p < last) positions[i] = last;
        last = positions[i]!;
      }
    }
    for (var i = 1; i < positions.length; i++) {
      if (positions[i] != null) continue;
      var j = i;
      while (positions[j] == null) {
        j++;
      }
      final a = positions[i - 1]!;
      final b = positions[j]!;
      for (var k = i; k < j; k++) {
        positions[k] = a + (b - a) * (k - i + 1) / (j - i + 1);
      }
    }
    return _Stops(colors, positions.map((p) => p!.clamp(0.0, 1.0)).toList());
  }

  static double? _parseStopPosition(String t, bool isConic) {
    if (t.endsWith('%')) {
      final v = double.tryParse(t.substring(0, t.length - 1));
      return v == null ? null : v / 100;
    }
    final angle = _parseAngle(t);
    if (angle != null && isConic) return angle / 360;
    return null;
  }

  /// 括弧の外の , で分ける
  static List<String> _splitTopLevel(String s) {
    final out = <String>[];
    var depth = 0;
    var start = 0;
    for (var i = 0; i < s.length; i++) {
      final c = s[i];
      if (c == '(') depth++;
      if (c == ')') depth--;
      if (c == ',' && depth == 0) {
        out.add(s.substring(start, i).trim());
        start = i + 1;
      }
    }
    out.add(s.substring(start).trim());
    return out.where((e) => e.isNotEmpty).toList();
  }

  /// 括弧の外の空白で分ける
  static List<String> _splitWords(String s) {
    final out = <String>[];
    var depth = 0;
    var buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      final c = s[i];
      if (c == '(') depth++;
      if (c == ')') depth--;
      if (depth == 0 && (c == ' ' || c == '\t' || c == '\n')) {
        if (buf.isNotEmpty) out.add(buf.toString());
        buf = StringBuffer();
      } else {
        buf.write(c);
      }
    }
    if (buf.isNotEmpty) out.add(buf.toString());
    return out;
  }
}

class CssLayer {
  const CssLayer({this.color, this.gradient});

  final Color? color;
  final Gradient? gradient;

  BoxDecoration get decoration => BoxDecoration(color: color, gradient: gradient);
}

class _Stops {
  const _Stops(this.colors, this.positions);

  final List<Color> colors;
  final List<double> positions;
}

const _namedColors = {
  'transparent': Color(0x00000000),
  'white': Color(0xFFFFFFFF),
  'black': Color(0xFF000000),
  'red': Color(0xFFFF0000),
  'green': Color(0xFF008000),
  'blue': Color(0xFF0000FF),
  'yellow': Color(0xFFFFFF00),
  'orange': Color(0xFFFFA500),
  'pink': Color(0xFFFFC0CB),
  'purple': Color(0xFF800080),
  'gold': Color(0xFFFFD700),
  'silver': Color(0xFFC0C0C0),
  'gray': Color(0xFF808080),
  'grey': Color(0xFF808080),
};

/// #rgb #rgba #rrggbb #rrggbbaa rgb() rgba() hsl() hsla() と主な色名
Color? parseCssColor(String raw) {
  final s = raw.trim().toLowerCase();
  if (s.startsWith('#')) return _hex(s.substring(1));
  final named = _namedColors[s];
  if (named != null) return named;
  final m = RegExp(r'^(rgb|hsl)a?\((.*)\)$').firstMatch(s);
  if (m == null) return null;
  final parts = m.group(2)!.split(RegExp(r'[\s,/]+')).where((e) => e.isNotEmpty).toList();
  if (parts.length < 3) return null;
  double alpha = 1;
  if (parts.length > 3) {
    alpha = parts[3].endsWith('%')
        ? (double.tryParse(parts[3].substring(0, parts[3].length - 1)) ?? 100) / 100
        : double.tryParse(parts[3]) ?? 1;
  }
  double pct(String p) => (double.tryParse(p.replaceAll('%', '')) ?? 0) / 100;
  if (m.group(1) == 'rgb') {
    double channel(String p) => p.endsWith('%') ? pct(p) : (double.tryParse(p) ?? 0) / 255;
    return Color.from(alpha: alpha.clamp(0, 1), red: channel(parts[0]).clamp(0, 1), green: channel(parts[1]).clamp(0, 1), blue: channel(parts[2]).clamp(0, 1));
  }
  final hue = (double.tryParse(parts[0].replaceAll('deg', '')) ?? 0) % 360;
  return HSLColor.fromAHSL(alpha.clamp(0, 1), hue, pct(parts[1]).clamp(0, 1), pct(parts[2]).clamp(0, 1)).toColor();
}

Color? _hex(String h) {
  var v = h;
  if (v.length == 3 || v.length == 4) v = v.split('').map((c) => '$c$c').join();
  if (v.length == 6) v = '${v}ff';
  if (v.length != 8) return null;
  final n = int.tryParse(v, radix: 16);
  if (n == null) return null;
  // CSS は RRGGBBAA
  return Color(((n & 0xFF) << 24) | (n >> 8));
}
