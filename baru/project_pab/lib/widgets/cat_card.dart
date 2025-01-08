import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  final Map<String, dynamic> cat;

  // Konstruktor untuk menerima data kucing
  CatCard({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Gambar kucing
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cat['image'],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          // Info kucing (nama, usia)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cat['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Age: ${cat['age']}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Ikon favorit
          GestureDetector(
            onTap: () {
              // Aksi ketika ikon favorit diklik
            },
            child: Icon(
              cat['isFavorite'] ? Icons.favorite : Icons.favorite_border,
              color: cat['isFavorite'] ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
