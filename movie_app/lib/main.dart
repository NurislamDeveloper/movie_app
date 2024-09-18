import 'package:flutter/material.dart';
// import 'package:movie_app/color.dart';
import 'package:movie_app/presentetion/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

