import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdtaeResult extends StatefulWidget {
  const UpdtaeResult({super.key});

  @override
  State<UpdtaeResult> createState() => _UpdtaeResultState();
}

class _UpdtaeResultState extends State<UpdtaeResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Result',
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 33.h,
        ),
        CustomTextField2(Title: 'Event Name', hintText: 'Margamkali'),
        SizedBox(
          height: 23.h,
        ),
        CustomTextField2(Title: 'Vedio Link', hintText: ''),
        SizedBox(
          height: 23.h,
        ),
        CustomTextField2(Title: 'Description', hintText: '', lines: 7),
        SizedBox(
          height: 23.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 23).r,
          child: Text(
            '  Result',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            // width: 350.w,
            height: 167.h,
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
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(20).w,
          child: ElevatedButton(
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
        ),
      ]),
    );
  }

  Padding CustomTextField2(
          {String? Title, String? hintText, var controller, int? lines}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Title!),
            TextFormField(
              minLines: lines,
              maxLines: lines,
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
