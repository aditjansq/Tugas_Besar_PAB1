import 'package:flutter/material.dart';
import 'chat_room_page.dart';

class CatDetailPage extends StatefulWidget {
  final Map<String, dynamic> cat;
  final Function(bool) onFavoriteChanged;
  final List<Map<String, dynamic>> otherCats;

  CatDetailPage({
    required this.cat,
    required this.onFavoriteChanged,
    required this.otherCats,
  });

  @override
  _CatDetailPageState createState() => _CatDetailPageState();
}

class _CatDetailPageState extends State<CatDetailPage> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.cat['isFavorite'];
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    widget.onFavoriteChanged(isLiked);
  }

  void navigateToChatRoom() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatRoomPage(
          catName: widget.cat['name'],
        ),
      ),
    );
  }

  void adoptNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Adoption process for ${widget.cat['name']} initiated!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Column(
            children: [
              // Bagian Gambar dengan Zoom View
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: InteractiveViewer(
                        child: Image.network(
                          widget.cat['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.cat['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            top: 350,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height - 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cat['name'],
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.redAccent),
                          SizedBox(width: 4),
                          Text(
                            "Location: Jakarta",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.pets, color: Colors.blue),
                              SizedBox(width: 8),
                              Text(
                                'Breed: ${widget.cat['breed']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                widget.cat['gender'] == 'Male'
                                    ? Icons.male
                                    : Icons.female,
                                color: widget.cat['gender'] == 'Male'
                                    ? Colors.blue
                                    : Colors.pink,
                              ),
                              SizedBox(width: 8),
                              Text(
                                widget.cat['gender'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 26),
                      Text(
                        widget.cat['description'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Other Cats You May Like',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.otherCats.length,
                          itemBuilder: (context, index) {
                            final otherCat = widget.otherCats[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CatDetailPage(
                                      cat: otherCat,
                                      onFavoriteChanged: (isFavorite) {},
                                      otherCats: widget.otherCats,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 16),
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      ),
                                      child: Image.network(
                                        otherCat['image'],
                                        height: 70,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      otherCat['name'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 80),
                      // Tombol Chat dan Adopt
                      Row(
                        children: [
                          // Tombol Chat Bulat
                          ElevatedButton(
                            onPressed: navigateToChatRoom,
                            child: Icon(Icons.chat, size: 30, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.all(18),
                              shape: CircleBorder(),
                            ),
                          ),
                          SizedBox(width: 16),
                          // Tombol Adopt
                          Expanded(
                            child: ElevatedButton(
                              onPressed: adoptNow,
                              child: Text(
                                'Adopt Now 🐾',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Tombol Back
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          // Tombol Love
          Positioned(
            top: 40,
            right: 16,
            child: GestureDetector(
              onTap: toggleLike,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
