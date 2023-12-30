import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParticipentList extends StatefulWidget {
  const ParticipentList({super.key});

  @override
  State<ParticipentList> createState() => _ParticipentListState();
}

class _ParticipentListState extends State<ParticipentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'participants List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20).w,
        child: Column(children: [
          SizedBox(
            height: 15.h,
          ),
          customContainer(),
          SizedBox(
            height: 15.h,
          ),
          customContainer(),
          SizedBox(
            height: 15.h,
          ),
          customContainer(),
        ]),
      ),
    );
  }

  Container customContainer() {
    return Container(
      width: 350.w,
      height: 60.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: Color(0xFF191717)),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          children: [
            Image.asset('assets/user2.1.png'),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    color: Color(0xFF1A1919),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  'ID Number',
                  style: TextStyle(
                    color: Color(0xFFB8B1B1),
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
