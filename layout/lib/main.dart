import 'package:flutter/material.dart';
import 'package:layout/pages/home.dart';

void main() {
  runApp(const MyApp());
}

// [1]
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "สัตว์โลกน่ารัก",
      home: const HomePage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 46, 156, 52),
        ),
      ),
    );
  }
}
