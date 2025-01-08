import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'cat_detail_page.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> allCats = [
    {
      "name": "Snowy",
      "age": "1 year",
      "description": "A playful and friendly cat. Loves cuddles.",
      "image":
          "https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg",
      "isFavorite": false,
      "breed": "Persian",
      "gender": "Female",
    },
    {
      "name": "Bella",
      "age": "2 years",
      "description": "A calm and gentle companion. Perfect for families.",
      "image":
          "https://studio.mrngroup.co/storage/app/media/Prambors/Editorial%203/Kucing-20230713184624.webp?tr=w-600",
      "isFavorite": false,
      "breed": "Siamese",
      "gender": "Male",
    },
    {
      "name": "Whiskers",
      "age": "3 years",
      "description": "Active and curious. Loves exploring new places.",
      "image":
          "https://res.cloudinary.com/dk0z4ums3/image/upload/v1729113851/attached_image/kucing-himalaya-kenali-keunikan-dan-cara-merawatnya.jpg",
      "isFavorite": false,
      "breed": "Bengal",
      "gender": "Female",
    },
  ];

  List<Map<String, dynamic>> filteredCats = [];
  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Persian",
    "Siamese",
    "Bengal",
    "Male",
    "Female"
  ];

  @override
  void initState() {
    super.initState();
    filteredCats = allCats;
  }

  void filterByCategory(String category) {
    if (category == "All") {
      setState(() {
        filteredCats = allCats;
      });
    } else {
      setState(() {
        filteredCats = allCats.where((cat) {
          return cat['breed'] == category || cat['gender'] == category;
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol back
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "🐾 ",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "Find Your Best Friend!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Stack(
                children: [
                  Icon(Icons.notifications_none, color: Colors.grey, size: 28),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "3", // Contoh jumlah notifikasi
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Find here...",
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
              onChanged: (value) {
                setState(() {
                  filteredCats = allCats.where((cat) {
                    return cat['name']
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        cat['description']
                            .toLowerCase()
                            .contains(value.toLowerCase());
                  }).toList();
                });
              },
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      filterByCategory(category);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedCategory == category
                            ? Colors.lightBlueAccent
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: selectedCategory == category
                            ? [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                )
                              ]
                            : [],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.pets,
                            color: selectedCategory == category
                                ? Colors.white
                                : Colors.grey[700],
                          ),
                          SizedBox(width: 8),
                          Text(
                            category,
                            style: TextStyle(
                              color: selectedCategory == category
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: filteredCats.isEmpty
                  ? Center(
                      child: Text(
                        "No cats found.",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredCats.length,
                      itemBuilder: (context, index) {
                        final cat = filteredCats[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CatDetailPage(
                                  cat: cat,
                                  onFavoriteChanged: (isFavorite) {
                                    setState(() {
                                      cat['isFavorite'] = isFavorite;
                                    });
                                  },
                                  otherCats: allCats,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    cat['image'],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        SizedBox(height: 8),
                                        Text(
                                          cat['description'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cat['isFavorite'] = !cat['isFavorite'];
                                    });
                                    Fluttertoast.showToast(
                                      msg: cat['isFavorite']
                                          ? "Added to Favorites"
                                          : "Removed from Favorites",
                                    );
                                  },
                                  child: Icon(
                                    cat['isFavorite']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: cat['isFavorite']
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
