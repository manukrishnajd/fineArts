import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddResult extends StatefulWidget {
  const AddResult({super.key});

  @override
  State<AddResult> createState() => _AddResultState();
}

class _AddResultState extends State<AddResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add Result',
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
          SizedBox(
            height: 47.h,
          ),
          Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Oppana',
                    style: TextStyle(
                      color: Color(0xFF1A1919),
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Icon(CupertinoIcons.chevron_down)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          Text(
            '   Image',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          Container(
            // width: 350.w,
            height: 197.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFB8B1B1)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: IconButton(
                  onPressed: () {}, icon: Image.asset('assets/photo 3.png')),
            ),
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
        ]),
      ),
    );
  }
}
