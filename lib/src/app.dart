import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';
import 'package:flutter_architecture_comparison/src/architectures/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architecture Comparison',
      home: HomeScreen(Repository())
    );
  }
}