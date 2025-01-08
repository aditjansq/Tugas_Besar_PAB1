import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'cat_detail_page.dart'; // Pastikan Anda mengimpor halaman detail kucing

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

  @override
  void initState() {
    super.initState();
    filteredCats = allCats;
  }

  void filterCats(String query) {
    final results = allCats.where((cat) {
      final nameLower = cat['name'].toLowerCase();
      final descriptionLower = cat['description'].toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          descriptionLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredCats = results;
    });
  }

  void clearSearch() {
    searchController.clear();
    filterCats('');
  }

  void showIosStyleNotification(String message) {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black.withOpacity(0.7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.info, color: Colors.white),
          SizedBox(width: 12.0),
          Text(message, style: TextStyle(color: Colors.white)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "PET TO ADOPT!",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
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
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.grey),
                        onPressed: clearSearch,
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {}); // Update state for suffix icon visibility
                filterCats(value);
              },
              onSubmitted: (value) {
                if (filteredCats.isEmpty && value.isNotEmpty) {
                  showIosStyleNotification("No results found for '\$value'");
                }
              },
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
                                builder: (context) => CatDetailPage(cat: cat),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    showIosStyleNotification(cat['isFavorite']
                                        ? "Added to Favorites"
                                        : "Removed from Favorites");
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


