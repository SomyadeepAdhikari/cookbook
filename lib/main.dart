import 'package:cookbook/home_page.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookBook',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'ArialRounded',
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 177, 255, 199),
          toolbarHeight: 75,
          elevation: 10,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          shadowColor: Color.fromARGB(255, 102, 180, 124)
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 26,
            fontFamily: 'ArialRounded'
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'ArialRounded'
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            fontFamily: 'ArialRounded'
          )
        ),
        //colorSchemeSeed:Color.fromARGB(255, 177, 255, 199),
        primaryColor :const Color.fromARGB(255, 177, 255, 199),
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
