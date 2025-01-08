import 'package:flutter/material.dart';
import 'package:project_pab/pages/home_pages.dart';
import 'package:project_pab/pages/main_pages.dart';
import 'package:project_pab/pages/message_pages.dart';
import 'package:project_pab/pages/favorite_pages.dart';
import 'package:project_pab/pages/pages.dart';
import 'package:project_pab/pages/profile_pages.dart';
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
      initialRoute: '/', // Rute awal aplikasi
      routes: {
        '/': (context) => WellcomePage(), // Mengarahkan ke HomePage pada rute awal
        '/main': (context) => MainPage(), // Mengarahkan ke HomePage pada rute awal
        '/home': (context) => HomePage(), // Mengarahkan ke HomePage pada rute awal
        // '/message': (context) => MessagePage(), // Halaman pesan
        '/favorite': (context) => FavoritePage(), // Halaman favorit  
        '/profile': (context) => ProfilePage(), // Halaman profil
      },
    );
  }
}


// Tes
