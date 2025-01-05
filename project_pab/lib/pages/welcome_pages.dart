part of 'pages.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({Key? key}) : super(key: key);
  
  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  bool _isHidden = true;
  bool _isHiddenCourse = true;
  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,  
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Image.asset(
              'assets/images/pet-img.png', 
              height: 333, 
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15),
            Text(
              'Welcome', 
              style: dangerTextStyle, 
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              "lorem jsland djsdksb ddhsjdkjsb, \nsed djjdiend", 
              style: whiteTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: () {
                  // NOTE: TAMPILAN MODAL REGISTER
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context, 
                    builder: (context){
                      return StatefulBuilder(
                        builder: (BuildContext context,
                        StateSetter setState){
                          return Wrap(
                            children: [
                              //BAGIAN MODAL
                              Container(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(40),
                                    topLeft: Radius.circular(40))),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: defaultMargin),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //JARAK
                                          SizedBox(height: 25,),
                                          Row(
                                            children: [
                                            Column(
                                              crossAxisAlignment: 
                                            CrossAxisAlignment.start,
                                              children: [
                                                Text("Hello...", 
                                                style: whiteTextStyle
                                                .copyWith(
                                                  fontSize: 20, 
                                                  color: blackColor),
                                                ),
                                                Text("Register", 
                                                style: whiteTextStyle
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30, 
                                                  color: blackColor),
                                                ),
                                              ],
                                            ),

                                            Spacer(),
                                            Center(
                                              child: InkWell
                                              (onTap: (){
                                                //KETIKA ICON DITEKAN
                                                Navigator.pop(context);
                                              },
                                                child: Image.asset('assets/images/pet-img.png', 
                                                height: 30,
                                                width: 30,),
                                              ),
                                            )
                                          ],
                                          ),
                                          SizedBox(
                                            height: 25,
                                            ),

                                            TextField(
                                              obscureText: _isHidden,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder (
                                                  borderRadius: BorderRadius.
                                                  circular(10),
                                                  ),
                                            hintText:
                                             "infoexample.com",
                                            labelText:
                                             "username atau email",
                                            suffixIcon: InkWell(
                                              onTap: _toogleUsernameView,
                                             child: Icon(
                                              _isHidden?
                                              Icons
                                             .visibility_outlined : Icons
                                             .visibility_off_outlined)))),

                                             SizedBox(
                                              height: 20,
                                              ),
                                              //note untuk course

                                              TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder (
                                                  borderRadius: BorderRadius.
                                                  circular(10),
                                                  ),
                                            hintText:
                                             "course",
                                            labelText:
                                             "course",
                                            suffixIcon: InkWell(
                                              onTap: _toogleCourseView,
                                             child: Icon(
                                              _isHiddenCourse?
                                              Icons
                                             .visibility_outlined : Icons
                                             .visibility_off_outlined)))),

                                             SizedBox(
                                              height: 20,
                                              ),

                                              //untuk password
                                              TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder (
                                                  borderRadius: BorderRadius.
                                                  circular(10),
                                                  ),
                                            hintText:
                                             "password",
                                            labelText:
                                             "password",
                                            suffixIcon: InkWell(
                                              onTap: _tooglePasswordView,
                                             child: Icon(
                                              _isHiddenPassword?
                                              Icons
                                             .lock_outline : Icons
                                             .lock_open_outlined)))),

                                             SizedBox(
                                              height: 20,
                                              ),

                                              TextField(
                                                obscureText: _isHiddenConfirmPassword,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder (
                                                  borderRadius: BorderRadius.
                                                  circular(10),
                                                  ),
                                            hintText:
                                             "confirm password",
                                            labelText:
                                             "confirm password",
                                            suffixIcon: InkWell(onTap: 
                                            _toogleConfirmPasswordView,
                                           child: Icon(
                                              _isHiddenPassword?
                                              Icons
                                             .lock_outline : Icons
                                             .lock_open_outlined)))),

                                             SizedBox(
                                              height: 20,),

              Container(
                  decoration: BoxDecoration(
    color: Color.fromARGB(255, 5, 5, 59),  // Set the background color to dark blue
    borderRadius: BorderRadius.circular(15),  // Optional: Add rounded corners
  ),
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: OutlinedButton(
                onPressed: () {},
              child: Text(
  'Register',
  style: whiteTextStyle.copyWith(
    fontSize: 20, 
    fontWeight: FontWeight.w500, 
    color: Colors.white,  // Set text color to white
    backgroundColor: Color.fromARGB(255, 0, 0, 139),  // Set the background color to dark blue (RGB for dark blue)
  ),
),

                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: secondaryColor, width: 3), // Border color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(height: defaultMargin,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already Have Account?", style: whiteTextStyle.
                copyWith(color: primaryColor, fontSize: 18)),
                Text("Login", style: whiteTextStyle.
                copyWith(color: dangerColor, fontSize: 18))

              ],
            )

                                        ],
                                      ),
                                    ),
                                ),
                              )
                            ],
                          );
                        },
                        );

                    });
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
                  backgroundColor: secondaryColor,  // Full background color for "Create Account"
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),  // Add spacing between buttons
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20, 
                    fontWeight: FontWeight.w500, 
                    color: secondaryColor,  // Set the text color
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: secondaryColor, width: 3), // Border color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),  // Space before footer text
            Text(
              'All Rights Reserved Mochi Pet',
              style: whiteTextStyle.copyWith(
                color: whiteColor, 
                fontSize: 16, 
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),  // Add some spacing below the footer
          ],
        ),
      ),
    );
  }
  void _toogleUsernameView() {
  setState(() {
    _isHidden = !_isHidden;
  });
}

void _toogleCourseView() {
  setState((){
    _isHiddenCourse = !_isHiddenCourse;
  });
}

void _tooglePasswordView(){
  setState((){
    _isHiddenPassword = !_isHiddenPassword;
  });
}

void _toogleConfirmPasswordView(){
  setState(() {
    _isHiddenConfirmPassword = !_isHiddenConfirmPassword;
  });
}
}



