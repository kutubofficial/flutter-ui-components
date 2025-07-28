import 'package:flutter/material.dart';
import 'authentication/loginpage.dart';
import 'academy_details/academy_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Login UI',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       brightness: Brightness.dark,
  //       primaryColor: Colors.yellow[700],
  //       fontFamily: 'Inter',
  //       scaffoldBackgroundColor: const Color(0xFF1A1A1A),
  //       textTheme: const TextTheme(
  //         bodyLarge: TextStyle(color: Colors.white),
  //         bodyMedium: TextStyle(color: Colors.white70),
  //       ),
  //       inputDecorationTheme: InputDecorationTheme(
  //         filled: true,
  //         fillColor: Colors.grey[850],
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(12.0),
  //           borderSide: BorderSide.none,
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(12.0),
  //           borderSide: BorderSide(color: Colors.yellow[700]!),
  //         ),
  //         labelStyle: TextStyle(color: Colors.grey[400]),
  //       ),
  //     ),
  //     // home: LoginPage(),
  //     home: Testpage(),
  //   );
  // }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        fontFamily: 'Inter',
      ),
      home: const AcademyDetailsPage(),
    );
  }
}
