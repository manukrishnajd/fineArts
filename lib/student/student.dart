import 'package:fine_arts/student/studentregistration.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Studentlogin extends StatefulWidget {
  const Studentlogin({super.key});

  @override
  State<Studentlogin> createState() => _StudentloginState();
}

class _StudentloginState extends State<Studentlogin> {
  var user = TextEditingController();
  var password = TextEditingController();

  final formKey = new GlobalKey<FormState>();

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
                    ));
              },
              child: Text(
                'Create  new Account',
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
      )),
    );
  }

  ElevatedButton customButton(double textSize, String text) => ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r))),
          minimumSize: MaterialStatePropertyAll(Size(350.w, 60.h)),
          backgroundColor: MaterialStatePropertyAll(Color(0xFF204563))),
      onPressed: () {
        if (formKey.currentState!.validate()) ;
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
      ));

  Padding customTextField(
    String hintText,
    var controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Empty field';
          }
        },
        decoration: InputDecoration(
          // prefixIcon: prefixIcon,

          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
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
