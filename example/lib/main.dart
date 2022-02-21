import 'package:flutter/material.dart';
import 'package:toggle_switch_plus/toggle_switch_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'An example app for toggle',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ToggleSwitchPlus(
            values: const ['male','female','other'],
            labels: const ['Male','Female','Other'],
            onChanged: (value) {
              debugPrint(value);
            },
          ),
        ),
      ),
    );
  }
}
