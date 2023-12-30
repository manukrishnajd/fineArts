import 'package:fine_arts/admin/studentdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StdlistBuilder extends StatefulWidget {
  const StdlistBuilder({super.key});

  @override
  State<StdlistBuilder> createState() => _StdlistBuilderState();
}

class _StdlistBuilderState extends State<StdlistBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Students List',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return StdDetails();
                    },
                  ));
                },
                child: Container(
                  height: 60.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF191717)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
