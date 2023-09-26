import 'package:flutter/widgets.dart';

String? nameExtractor(RouteSettings settings) {
  final name = settings.name;

  if (name == null) {
    return name;
  }

  final arguments = settings.arguments;

  if (arguments == null) {
    return settings.name;
  }

  final argumentMap = arguments as Map;

  final keyList = argumentMap.keys.toList();

  final paths = name.split('/');

  final replacedPaths = paths.map((path) {
    for (var key in keyList) {
      final argument = argumentMap[key];
      return path.replaceAll(':$key', argument);
    }
    return path;
  });

  return replacedPaths.join('/');
}
