import 'package:fine_arts/organizer/appealDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppealList extends StatefulWidget {
  const AppealList({super.key});

  @override
  State<AppealList> createState() => _AppealListState();
}

class _AppealListState extends State<AppealList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appeal List',
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
            height: 18.h,
          ),
          customContainer(text: ''),
          SizedBox(
            height: 15.h,
          ),
          customContainer(text: 'Rejected', color: Colors.red),
          SizedBox(
            height: 15.h,
          ),
          customContainer(text: 'Accepted', color: Colors.green),
          SizedBox(
            height: 15.h,
          ),
          customContainer(text: 'Accepted', color: Colors.green),
          SizedBox(
            height: 15.h,
          ),
        ]),
      ),
    );
  }

  InkWell customContainer({String? text, Color? color}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppealDetails(),
            ));
      },
      child: Container(
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
              ),
              Spacer(),
              Text(
                text!,
                style: TextStyle(
                  color: color,
                  fontSize: 13.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
