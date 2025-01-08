// import 'package:flutter/material.dart';

// class FavoritePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Page'),
//       ),
//       body: Center(
//         child: Text('Ini halaman Favorite'),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'favorites.dart';  // Import provider
import 'package:provider/provider.dart'; // Pastikan provider ada di pubspec.yaml

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kucing Favorit'),
      ),
      body: Consumer<FavoriteCatsProvider>(
        builder: (context, favoriteCatsProvider, child) {
          if (favoriteCatsProvider.favoriteCats.isEmpty) {
            return Center(child: Text('Tidak ada kucing favorit.'));
          } else {
            return ListView.builder(
              itemCount: favoriteCatsProvider.favoriteCats.length,
              itemBuilder: (context, index) {
                final cat = favoriteCatsProvider.favoriteCats[index];
                return ListTile(
                  title: Text(cat.name),
                  subtitle: Text(cat.breed),
                  leading: Image.network(cat.imageUrl),
                );
              },
            );
          }
        },
      ),
    );
  }
}

