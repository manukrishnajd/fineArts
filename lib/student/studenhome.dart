import 'package:fine_arts/student/eventdetails.dart';
import 'package:fine_arts/student/resultdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Studenthome extends StatefulWidget {
  const Studenthome({super.key});

  @override
  State<Studenthome> createState() => _StudenthomeState();
}

class _StudenthomeState extends State<Studenthome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            TabBarView(children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Center(
                    child: Text(
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
                  SizedBox(
                    height: 28.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Eventdetails();
                        },
                      ));
                    },
                    child: Container(
                      width: 350.w,
                      height: 50.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 28),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.w, color: Color(0xFF558DBA)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Row(children: [
                        Image.asset('assets/photo 1.png'),
                        SizedBox(
                          width: 28.w,
                        ),
                        Text(
                          'Mohiniyattam',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 350.w,
                    height: 50.h,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 28),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: Color(0xFF558DBA)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Row(children: [
                      Image.asset('assets/photo 1.png'),
                      SizedBox(
                        width: 28.w,
                      ),
                      Text(
                        'Kolkali',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ]),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Center(
                    child: Text(
                      'Result',
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
                    height: 28.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Resultdetails(),
                          ));
                    },
                    child: Container(
                      width: 350.w,
                      height: 50.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 28),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.w, color: Color(0xFF558DBA)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Row(children: [
                        Image.asset('assets/photo 1.png'),
                        SizedBox(
                          width: 28.w,
                        ),
                        Text(
                          'Mohiniyattam',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 350.w,
                    height: 50.h,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 28),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: Color(0xFF558DBA)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Row(children: [
                      Image.asset('assets/photo 1.png'),
                      SizedBox(
                        width: 28.w,
                      ),
                      Text(
                        'Kolkali',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ]),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: Color(0xFF204563)),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Color(0xFFFDBE40),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4.r,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ]),
                    tabs: [
                      Tab(
                        child: Text(
                          'Event',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Result',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      )
                    ]),
              ),
            )
          ],
        )),
      ),
    );
  }
}
