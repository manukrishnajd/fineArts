import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddResult extends StatefulWidget {
  const AddResult({Key? key});

  @override
  State<AddResult> createState() => _AddResultState();
}

class _AddResultState extends State<AddResult> {
  String selectedEvent = ''; // Store the selected event
  File? _imageFile; // Store the picked image

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

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
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 47.h),
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
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                child: DropdownButton<String>(
                  value: selectedEvent.isNotEmpty ? selectedEvent : null,
                  hint: Text(
                    'Select Event',
                    style: TextStyle(
                      color: Color(0xFF1A1919),
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedEvent = newValue ?? '';
                    });
                  },
                  items: [
                    // Populate dropdown items with assigned events using organiserDocId from shared preference
                    DropdownMenuItem(
                      value: 'Event 1 ID',
                      child: Text('Event 1 Name'),
                    ),
                    DropdownMenuItem(
                      value: 'Event 2 ID',
                      child: Text('Event 2 Name'),
                    ),
                    // Add more dropdown items based on assigned events
                  ],
                ),
              ),
            ),
            SizedBox(height: 23.h),
            Text(
              'Image',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            GestureDetector(
              onTap: _getImage,
              child: Container(
                height: 197.h,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: Color(0xFFB8B1B1)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: _imageFile != null
                      ? Image.file(_imageFile!, fit: BoxFit.cover)
                      : Icon(
                          Icons.camera_alt,
                          size: 50.sp,
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(Size(350.w, 50.h)),
                backgroundColor: MaterialStateProperty.all(Color(0xFF204563)),
              ),
              onPressed: () {
                // Send the picked image and selected event details to the result collection
                if (selectedEvent.isNotEmpty && _imageFile != null) {
                  // Handle sending the data to Firestore here
                  // Example: FirebaseFirestore.instance.collection('results').doc(selectedEvent).set({...});
                }
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
