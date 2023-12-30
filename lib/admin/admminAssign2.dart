import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssignAdmin2 extends StatefulWidget {
  const AssignAdmin2({super.key});

  @override
  State<AssignAdmin2> createState() => _AssignAdmin2State();
}

class _AssignAdmin2State extends State<AssignAdmin2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Assign',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20).w,
        child: Column(children: [
          SizedBox(
            height: 41.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: Color(0xFF204563)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15).r,
                width: 293.w,
                height: 51.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF558DBA),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
                child: Text(
                  'Kathakali',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: Color(0xFF204563)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15).r,
                width: 293.w,
                height: 51.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF558DBA),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
                child: Text(
                  'Kolkali',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                    minimumSize: MaterialStatePropertyAll(Size(350.w, 50.h)),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF204563))),
                onPressed: () {
                  // if (formkey.currentState!.validate()) ;
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return AssignAdmin2();
                    },
                  ));
                },
                child: Text(
                  'Assign',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
