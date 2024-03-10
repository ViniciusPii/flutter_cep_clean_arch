import 'package:flutter/material.dart';
import 'package:flutter_arch/src/app.dart';
import 'package:flutter_arch/src/di/inject.dart';

void main() {
  Inject.initialize();
  runApp(const App());
}
