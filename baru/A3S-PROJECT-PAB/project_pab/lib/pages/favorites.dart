import 'package:flutter/material.dart';

class Cat {
  final String name;
  final String breed;
  final String imageUrl;

  Cat({required this.name, required this.breed, required this.imageUrl});
}

class FavoriteCatsProvider extends ChangeNotifier {
  List<Cat> _favoriteCats = [];

  List<Cat> get favoriteCats => _favoriteCats;

  void addToFavorites(Cat cat) {
    _favoriteCats.add(cat);
    notifyListeners();  // Notifikasi perubahan data
  }
}
