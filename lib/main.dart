import 'package:flutter/material.dart';
import 'component/circularSlider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      home: CircularSlider(
        value: 250,
        onValueChange: this.buildPrint,
      ),
    );
  }

  void buildPrint(int value) => print(value);
}
