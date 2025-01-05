import 'package:flutter/material.dart';
import 'package:project_pab/pages/pages.dart';
import 'package:project_pab/shared/shared.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorPalette.purpleColor,
        primaryColor: primaryColor,
        canvasColor: Colors.transparent,
      ),
      home: WellcomePage(),
    );
  }
}