import 'package:fine_arts/organizer/organizerAssign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrgRegistration extends StatefulWidget {
  const OrgRegistration({super.key});

  @override
  State<OrgRegistration> createState() => _OrgRegistrationState();
}

class _OrgRegistrationState extends State<OrgRegistration> {
  var username = TextEditingController();
  var phonenumber = TextEditingController();
  var email = TextEditingController();
  var idnumber = TextEditingController();

  final formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(),
      body: SafeArea(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 14.h,
                  ),
                  SizedBox(
                      height: 110.h,
                      width: 110.w,
                      child: Image.asset('assets/image 1.png')),
                  SizedBox(
                    height: 40.h,
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
                    height: 26.h,
                  ),
                  CustomTextField2(
                    controller: username,
                    Title: 'Name',
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  CustomTextField2(
                    controller: phonenumber,
                    Title: 'Phone No',
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  CustomTextField2(
                    controller: email,
                    Title: 'Email',
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  CustomTextField2(
                    controller: idnumber,
                    Title: 'ID Number',
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Spacer(),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          minimumSize:
                              MaterialStatePropertyAll(Size(350.w, 50.h)),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF204563))),
                      onPressed: () {
                        if (formKey.currentState!.validate())
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return OrgAssign();
                            },
                          ));
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
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ))),
    );
  }

  Padding CustomTextField2({String? Title, String? hintText, var controller}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
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
              },
              decoration: InputDecoration(
                // prefixIcon: prefixIcon,

                hintText: hintText,

                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                ).r,
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
