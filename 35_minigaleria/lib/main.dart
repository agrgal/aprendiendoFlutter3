import 'package:flutter/material.dart';
// import 'package:minigaleria/pages/home_page.dart';
import 'pages/home_page_safe.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageSafe(),
    );
  }
}