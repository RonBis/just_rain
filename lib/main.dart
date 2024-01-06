import 'package:flutter/material.dart';
import 'package:just_rain/rain.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Just Rain",
      debugShowCheckedModeBanner: false,
      home: RainWidget(),
    );
  }
}
