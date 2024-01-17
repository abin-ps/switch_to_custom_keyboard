import 'package:flutter/material.dart';
import 'package:switch_to_custom_keyboard/pages/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      home: const HomePage(),
    );
  }
}
