import 'package:flutter/material.dart';
import 'package:project_pab/pages/home_pages.dart';
import 'package:project_pab/pages/message_pages.dart';
import 'package:project_pab/pages/favorite_pages.dart';
import 'package:project_pab/pages/profile_pages.dart';
import 'package:project_pab/widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // List halaman yang akan ditampilkan
  final List<Widget> _pages = [
    HomePage(),
    MessagePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  // Fungsi untuk menangani perubahan item navbar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman berdasarkan _selectedIndex
      body: _pages[_selectedIndex],
      // Menambahkan BottomNavBar hanya di sini
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}



