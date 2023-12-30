import 'package:fine_arts/admin/adminAddEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEvent extends StatefulWidget {
  const AdminEvent({super.key});

  @override
  State<AdminEvent> createState() => _AdminEventState();
}

class _AdminEventState extends State<AdminEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 68).h,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEventAdmin(),
                ));
          },
          child: Icon(
            CupertinoIcons.plus,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFFFDBE40),
          shape: CircleBorder(),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Event',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      body: Column(children: [customContainer()]),
    );
  }

  Container customContainer() => Container(
        width: 350.w,
        height: 130.h,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
        decoration: ShapeDecoration(
          color: Color(0xFF558DBA),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: Color(0xFF558DBA)),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    'Margamkali',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Spacer(),
                  Icon(CupertinoIcons.delete_solid)
                ],
              ),
              Text(
                'Date   : 08/02/2023',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Text(
                'Time   : 10:00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.h,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stage : 5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Spacer()
                  // InkWell(
                  //     onTap: () {
                  //       // Navigator.push(
                  //       //     context,
                  //       //     MaterialPageRoute(
                  //       //       builder: (context) => EditEvent(),
                  //       //     ));
                  //     },
                  //     child: Icon(Icons.edit_square)),
                ],
              )
            ]),
      );
}
