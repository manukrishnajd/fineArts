import 'package:fine_arts/organizer/updateResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Event Detail ',
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // SizedBox(
          //   height: 18.h,
          // ),
          Center(
            child: Text(
              'Mohiniyattam',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
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
                    'Date',
                    style: TextStyle(
                      color: Color(0xFF1A1919),
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Stage No',
                    style: TextStyle(
                      color: Color(0xFF1A1919),
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Time',
                    style: TextStyle(
                      color: Color(0xFF1A1919),
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
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
                    '18/07/23',
                    style: TextStyle(
                      color: Color(0xFFB8B1B1),
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    '02',
                    style: TextStyle(
                      color: Color(0xFFB8B1B1),
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    '1:30 pm',
                    style: TextStyle(
                      color: Color(0xFFB8B1B1),
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Text(
                    'Ground',
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
          SizedBox(
            height: 46.h,
          ),
          Text(
            '  Result',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          Container(
            // width: 350.w,
            height: 350.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFB8B1B1)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdtaeResult(),
                        ));
                  },
                  icon: Image.asset('assets/photo 3.png')),
            ),
          ),
          Spacer(),
        ]),
      ),
    );
  }
}
