import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEventAdmin extends StatefulWidget {
  const AddEventAdmin({super.key});

  @override
  State<AddEventAdmin> createState() => _AddEventAdminState();
}

class _AddEventAdminState extends State<AddEventAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add Event',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )),
      body: Column(children: [
        SizedBox(
          height: 44.h,
        ),
        CustomTextField2(Title: 'Name', hintText: 'name'),
        SizedBox(
          height: 23.h,
        ),
        CustomTextField2(Title: 'Date', hintText: ''),
        SizedBox(
          height: 23.h,
        ),
        CustomTextField2(Title: 'Stage No', hintText: ''),
        SizedBox(
          height: 23.h,
        ),
        CustomTextField2(Title: 'Time', hintText: ''),
        SizedBox(
          height: 23.h,
        ),
        Spacer(),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r))),
                minimumSize: MaterialStatePropertyAll(Size(350.w, 50.h)),
                backgroundColor: MaterialStatePropertyAll(Color(0xFF204563))),
            onPressed: () {
              // if (formkey.currentState!.validate()) ;
              // Navigator.pushReplacement(context, MaterialPageRoute(
              //   builder: (context) {
              //     return Studenthome();
              //   },
              // ));
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
        )
      ]),
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
