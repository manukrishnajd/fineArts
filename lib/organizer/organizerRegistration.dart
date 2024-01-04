import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_arts/organizer/organizerAssign.dart';

class OrgRegistration extends StatefulWidget {
  const OrgRegistration({Key? key});

  @override
  State<OrgRegistration> createState() => _OrgRegistrationState();
}

class _OrgRegistrationState extends State<OrgRegistration> {
  var username = TextEditingController();
  var phonenumber = TextEditingController();
  var email = TextEditingController();
  var idnumber = TextEditingController();
  var department = TextEditingController();
  var password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 14.h),
            SizedBox(
              height: 110.h,
              width: 110.w,
              child: Image.asset('assets/image 1.png'),
            ),
            SizedBox(height: 40.h),
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
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField2(
                        controller: username,
                        Title: 'Name',
                      ),
                      SizedBox(height: 22.h),
                      CustomTextField2(
                        controller: phonenumber,
                        Title: 'Phone No',
                      ),
                      SizedBox(height: 22.h),
                      CustomTextField2(
                        controller: email,
                        Title: 'Email',
                      ),
                      SizedBox(height: 22.h),
                      CustomTextField2(
                        controller: department,
                        Title: 'Department',
                      ),
                      SizedBox(height: 22.h),
                      CustomTextField2(
                        controller: idnumber,
                        Title: 'ID Number',
                      ),
                      SizedBox(height: 22.h),
                      CustomTextField2(
                        controller: password,
                        Title: 'Password',
                      ),
                      SizedBox(height: 22.h),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(Size(350.w, 50.h)),
                          backgroundColor: MaterialStateProperty.all(Color(0xFF204563)),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _addToOrganiserCollection();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return OrgAssign();
                              }),
                            );
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToOrganiserCollection() {
  String userName = username.text;
  String phoneNumber = phonenumber.text;
  String emailAddress = email.text;
  String idNumber = idnumber.text;
  String userPassword = password.text; // Extract the password text
  String userDepartment = department.text; // Extract the department text

  CollectionReference organiserCollection =
      FirebaseFirestore.instance.collection('organiser');

  organiserCollection.add({
    'name': userName,
    'phonenumber': phoneNumber,
    'email': emailAddress,
    'idnumber': idNumber,
    'password': userPassword, // Store the extracted password text
    'department': userDepartment, // Store the extracted department text
  }).then((value) {
    print('Organizer added to Firestore');
  }).catchError((error) {
    print('Failed to add organizer: $error');
  });
}
}

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String? Title;

  const CustomTextField2({
    Key? key,
    required this.controller,
    this.Title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Title!),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Empty field';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: Title,
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
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
        ],
      ),
    );
  }
}
