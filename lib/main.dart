import 'package:bookara/app.dart';
import 'package:bookara/configs.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await configs();
  runApp(const App());
}
