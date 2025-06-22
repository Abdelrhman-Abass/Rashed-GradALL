import 'package:flutter/material.dart';

void bigPrint(String text) {
  final pattern = RegExp('.{1,1800}'); // 1800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
}