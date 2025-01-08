part of 'pages.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({Key? key}) : super(key: key);

  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;
  bool _isHidden = true; // Nilai default untuk sembunyikan teks

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Fungsi untuk menyimpan data ke SharedPreferences

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);

    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pendaftaran Berhasil'),
          content: Text('Data Anda telah disimpan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
                _clearForm(); // Opsional: Membersihkan form setelah berhasil daftar
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _clearForm() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  void handelLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            SizedBox(height: 150),
            Image.asset(
              'assets/images/cat-gemes.png',
              width: 28,
              height: 230,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 80),
            Text(
              'Selamat Datang',
              style: dangerTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              "Daftar sekarang untuk mulai perjalanan Anda bersama para kucing menggemaskan yang membutuhkan rumah penuh cinta. 🐱",
              style: blackTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Wrap(
                            children: [
                              // MODAL REGISTER
                              Container(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40),
                                    ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: defaultMargin),
                                    child: SingleChildScrollView(
                                      // Membungkus dengan SingleChildScrollView agar bisa bergulir
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 25),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Hello...",
                                                    style:
                                                        whiteTextStyle.copyWith(
                                                            fontSize: 20,
                                                            color: blackColor),
                                                  ),
                                                  Text(
                                                    "Register",
                                                    style:
                                                        whiteTextStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 30,
                                                            color: blackColor),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 25),

                                          // Username atau Email
                                          TextFormField(
                                            controller: _emailController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "infoexample.com",
                                              labelText: "Email",
                                              suffixIcon: InkWell(
                                                onTap: () {
                                                  // aksi ketika ikon di-tap, bisa diisi dengan fungsi lain
                                                },
                                                child: Icon(
                                                  Icons
                                                      .lock_outline, // Ikon gembok biasa
                                                ),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Email tidak boleh kosong';
                                              } else if (!RegExp(
                                                      r'^[^@]+@[^@]+\.[^@]+')
                                                  .hasMatch(value)) {
                                                return 'Masukkan email yang valid';
                                              }
                                              return null;
                                            },
                                          ),

                                          SizedBox(height: 20),

                                          // Password
                                          TextFormField(
                                            controller: _passwordController,
                                            obscureText: !_isPasswordVisible,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "Password",
                                              labelText: "Password",
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  _isPasswordVisible
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _isPasswordVisible =
                                                        !_isPasswordVisible; // Toggle visibilitas password
                                                  });
                                                },
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Password tidak boleh kosong';
                                              } else if (value.length < 6) {
                                                return 'Password minimal 6 karakter';
                                              }
                                              return null;
                                            },
                                          ),

                                          SizedBox(height: 20),

                                          // Confirm Password
                                          TextFormField(
                                              controller:
                                                  _confirmPasswordController,
                                              obscureText:
                                                  !_isConfirmPasswordVisible,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                hintText: "Confirm Password",
                                                labelText: "Confirm Password",
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _isConfirmPasswordVisible
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isConfirmPasswordVisible =
                                                          !_isConfirmPasswordVisible; // Toggle visibilitas password
                                                    });
                                                  },
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Konfirmasi password tidak boleh kosong';
                                                } else if (value !=
                                                    _passwordController.text) {
                                                  return 'Password tidak cocok';
                                                }
                                                return null;
                                              }),

                                          SizedBox(height: 50),

                                          // TOMBOL REGISTER SUBMIT

                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Color.fromARGB(255, 5, 5, 59),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                2 * defaultMargin,
                                            child: OutlinedButton(
                                              // AKSI REGISTER
                                              onPressed: () {
                                                if (_formkey.currentState!
                                                    .validate()) {
                                                  _saveData();
                                                }
                                              },
                                              child: Text(
                                                'Registerrr',
                                                style: whiteTextStyle.copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                side: BorderSide(
                                                  color: blackColor,
                                                  width: 3,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),

                                          SizedBox(height: 20),

                                          Center(
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: RichText(
                                                text: TextSpan(
                                                  text:
                                                      "Already have an account? ",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                    color: blackColor,
                                                    fontSize: 16,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: "Login here",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                        color: dangerColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                child: Text(
                  'Create Account',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15), // Add spacing between buttons

            // LOGIN -
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: () {
                  // Tampilkan modal login
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Wrap(
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40),
                                    ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: defaultMargin),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 25),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Hello...",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontSize: 20,
                                                          color: blackColor),
                                                ),
                                                Text(
                                                  "Login",
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 30,
                                                          color: blackColor),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Center(
                                              child: InkWell(
                                                onTap: () {
                                                  // Kembali ke halaman sebelumnya
                                                  Navigator.pop(context);
                                                },
                                                child: Icon(
                                                  Icons.close, // Ikon close
                                                  size: 30, // Ukuran ikon
                                                  color: Colors
                                                      .black, // Warna ikon
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 25),
                                        // FORM INPUT UNTUK LOGIN
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            hintText: "example@domain.com",
                                            labelText: "Email",
                                            suffixIcon: InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons
                                                    .lock_outline, // Ikon gembok biasa
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        // Password field
                                        TextField(
                                          obscureText: !_isPasswordVisible,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Password',
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                _isPasswordVisible
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _isPasswordVisible =
                                                      !_isPasswordVisible; // Toggle visibilitas password
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 50),
                                        // Tombol Lanjutkan

                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 5, 5, 59),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          height: 60,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              2 * defaultMargin,
                                          child: OutlinedButton(
                                            onPressed: handelLogin,
                                            child: Text(
                                              'Lanjutkan',
                                              style: whiteTextStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color: blackColor, width: 3),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        // Teks "Don't have an account? Register"
                                        Center(
                                          child: TextButton(
                                            onPressed: () {
                                              // Navigasi ke halaman registrasi
                                              Navigator.pop(context);
                                              // Tampilkan halaman registrasi di sini
                                            },
                                            child: RichText(
                                              text: TextSpan(
                                                text: "Don't have an account? ",
                                                style: whiteTextStyle.copyWith(
                                                  color:
                                                      blackColor, // Warna teks hitam untuk bagian ini
                                                  fontSize: 16,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "Register",
                                                    style:
                                                        whiteTextStyle.copyWith(
                                                      color:
                                                          dangerColor, // Warna oranye untuk "Register"
                                                      fontSize: 16,
                                                      fontWeight: FontWeight
                                                          .bold, // Agar lebih menonjol
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                child: Text(
                  'Login',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: buttonColor,
                  ),
                ),
                style: TextButton.styleFrom(
                  side: BorderSide(
                      color: buttonColor,
                      width: 2), // Outline dengan warna secondaryColor
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15), // Sudut tombol dibulatkan
                  ),
                  backgroundColor:
                      primaryColor, // Tidak ada latar belakang (fill)
                ),
              ),
            ),

            SizedBox(height: 30), // Space before footer text
            Text(
              'All Rights Reserved Mochi Pet',
              style: whiteTextStyle.copyWith(
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30), // Add some spacing below the footer
          ],
        ),
      ),
    );
  }
}


