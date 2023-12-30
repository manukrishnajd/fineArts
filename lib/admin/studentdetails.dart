import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StdDetails extends StatefulWidget {
  const StdDetails({super.key});

  @override
  State<StdDetails> createState() => _StdDetailsState();
}

class _StdDetailsState extends State<StdDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          // automaticallyImplyLeading: false,
          title: Text(
            'Students Details',
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
          height: 75,
        ),
        Center(child: Image.asset('assets/user2.png')),
        SizedBox(
          height: 18.h,
        ),
        Text(
          'Name',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        SizedBox(
          height: 41.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Id Number',
                  style: TextStyle(
                    color: Color(0xFF1A1919),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Department',
                  style: TextStyle(
                    color: Color(0xFF1A1919),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    color: Color(0xFF1A1919),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Location',
                  style: TextStyle(
                    color: Color(0xFF1A1919),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '000000',
                  style: TextStyle(
                    color: Color(0xFFB8B1B1),
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Bsc Computer',
                  style: TextStyle(
                    color: Color(0xFFB8B1B1),
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  '9876543210',
                  style: TextStyle(
                    color: Color(0xFFB8B1B1),
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Collage',
                  style: TextStyle(
                    color: Color(0xFFB8B1B1),
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
          ],
        ),
        Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 165.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF0C5600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Center(
                  child: Text(
                    'Accept',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Container(
                width: 165.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFAD290C),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Center(
                  child: Text(
                    'Reject',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Spacer(),
      ]),
    );
  }
}
