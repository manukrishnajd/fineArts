import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppealDetails extends StatefulWidget {
  const AppealDetails({super.key});

  @override
  State<AppealDetails> createState() => _AppealDetailsState();
}

class _AppealDetailsState extends State<AppealDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appeal Details',
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
      body: Column(children: [
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
          height: 168.h,
        ),
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
        )
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
