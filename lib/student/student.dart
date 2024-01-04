import 'package:fine_arts/student/studenhome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'studentregistration.dart';

class Studentlogin extends StatefulWidget {
  const Studentlogin({Key? key}) : super(key: key);

  @override
  State<Studentlogin> createState() => _StudentloginState();
}

class _StudentloginState extends State<Studentlogin> {
  var user = TextEditingController();
  var password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFF204563),
                    fontSize: 30.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                height: 74.h,
              ),
              customTextField('username', user),
              SizedBox(
                height: 20.h,
              ),
              customTextField('password', password),
              SizedBox(
                height: 30.h,
              ),
              customButton(18.0, "Login"),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StdRegister(),
                    ),
                  );
                },
                child: Text(
                  'Create new Account',
                  style: TextStyle(
                    color: Color(0xFF204563),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton customButton(double textSize, String text) => ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          )),
          minimumSize: MaterialStateProperty.all(Size(350.w, 60.h)),
          backgroundColor: MaterialStateProperty.all(Color(0xFF204563)),
        ),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            String email = user.text.trim();
            String pwd = password.text.trim();
                print(email);
                print(pwd);
            try {
              UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                email: email,
                password: pwd,
              );
              // Retrieve user data from Firestore
              if (userCredential.user != null) {
                DocumentSnapshot userData = await _firestore.collection('users').doc(userCredential.user!.uid).get();
                if (userData.exists) {
                  // Check user status or other data as needed
                  String status = userData['status'];
                  if (status == 'Accepted') {
                    // User status is accepted, navigate to home or another screen
                    // Replace `HomeScreen` with your desired screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Studenthome()),
                    );
                  } else {
                    // User status is not accepted
                    // You can show a message or handle accordingly
                    print('User status is not accepted');
                  }
                }
              }
            } catch (e) {
              // Handle login errors here
              print('Login Error: $e');
            }
          }
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      );

  Padding customTextField(String hintText, var controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Empty field';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintStyle: TextStyle(
            color: Color(0xFF1A1919),
            fontSize: 15.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
