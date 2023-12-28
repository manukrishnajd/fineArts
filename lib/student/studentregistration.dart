import 'package:fine_arts/student/studenhome.dart';
import 'package:fine_arts/widgets/customTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StdRegister extends StatefulWidget {
  const StdRegister({super.key});

  @override
  State<StdRegister> createState() => _StdRegisterState();
}

class _StdRegisterState extends State<StdRegister> {
  var username = TextEditingController();
  var phonenumber = TextEditingController();
  var email = TextEditingController();
  var idnumber = TextEditingController();
  var department = TextEditingController();
  // var phonenumber = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Center(
              child: Text(
                'Registration',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: 47.h,
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
            CustomTextField2(
              controller: department,
              Title: 'Department',
            ),
            Spacer(),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                    minimumSize: MaterialStatePropertyAll(Size(350.w, 50.h)),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF204563))),
                onPressed: () {
                  if (formkey.currentState!.validate()) ;
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Studenthome();
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
        ),
      )),
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
