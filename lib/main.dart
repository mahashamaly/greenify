import 'package:flutter/material.dart';
import 'package:greenify/screens/details_screen.dart';
import 'package:greenify/screens/home.dart';
import 'package:greenify/screens/login.dart';
import 'package:greenify/screens/registar.dart';
import 'package:greenify/shared/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: appBarGreen,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
          toolbarTextStyle: TextStyle(color: Colors.white,fontSize: 18),
          

        )
      ),
      home: DetailsScreen()

    );
  }
}
