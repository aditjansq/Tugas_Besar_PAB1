import 'package:flutter/material.dart';

class CatDetailPage extends StatefulWidget {
  final Map<String, dynamic> cat;

  CatDetailPage({required this.cat});

  @override
  _CatDetailPageState createState() => _CatDetailPageState();
}

class _CatDetailPageState extends State<CatDetailPage> {
  bool isLiked = false; // Status awal untuk like

  void toggleLike() {
    setState(() {
      isLiked = !isLiked; // Ubah status
    });
  }

  void adoptNow() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.pets,
                  size: 50,
                  color: Colors.orange,
                ),
                SizedBox(height: 16),
                Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'You have successfully adopted ${widget.cat['name']}!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Okay',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
              // Gambar kucing besar
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.cat['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Ruang kosong untuk background detail
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // Bagian detail kucing
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
                      // Nama dan lokasi
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
                      // Informasi tambahan
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
                      SizedBox(height: 16),
                      // Deskripsi
                      Text(
                        widget.cat['description'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Galeri gambar kecil
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          galleryImage(widget.cat['image']),
                          galleryImage(widget.cat['image']),
                          galleryImage(widget.cat['image']),
                          galleryImage(widget.cat['image']),
                        ],
                      ),
                      SizedBox(height: 60), // Ruang untuk tombol di bawah
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Tombol back
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          // Tombol Love
          Positioned(
            top: 40,
            right: 16,
            child: GestureDetector(
              onTap: toggleLike, // Toggle like ketika ditekan
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border, // Ubah ikon berdasarkan status
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          // Tombol Adopt Now
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: adoptNow, // Panggil fungsi adoptNow
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                "Adopt Now",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk galeri gambar kecil
  Widget galleryImage(String imageUrl) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
