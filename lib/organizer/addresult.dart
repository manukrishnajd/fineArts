import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_arts/organizer/eventOrganizer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddResult extends StatefulWidget {
  const AddResult({Key? key}) : super(key: key);

  @override
  State<AddResult> createState() => _AddResultState();
}

class _AddResultState extends State<AddResult> {
  List<Map<String, dynamic>> options = [];
  String? selectedOption;
  File? _imageFile;
  var _imageName;

  @override
  void initState() {
    super.initState();
    getEvent();
  }

  Future<void> getEvent() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var organiserId = spref.getString('organizerDocId');
    print(organiserId);

    var querySnapshot = await FirebaseFirestore.instance
        .collection('events')
        .where('organiserId', isEqualTo: organiserId)
        .get();

    List<Map<String, dynamic>> newOptions = [];

    querySnapshot.docs.forEach((doc) {
      var eventData = {
        'value': doc.id,
        'label': doc['name'],
      };
      newOptions.add(eventData);
    });

    setState(() {
      options = newOptions;
      if (options.isNotEmpty) {
        selectedOption = options[0]['value'];
      }
    });
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
        _imageName = pickedImage.name;
      });
    }
  }

  Future<void> _submitDataAndNavigate() async {
    if (_imageFile != null && selectedOption != null) {
      SharedPreferences spref = await SharedPreferences.getInstance();
      var organiserId = spref.getString('organizerDocId');

      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      UploadTask uploadTask = storageReference.putFile(_imageFile!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await storageReference.getDownloadURL();

      await FirebaseFirestore.instance.collection('result').add({
        'org_id': organiserId,
        'event': selectedOption,
        'image_url': imageUrl,
      });

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // Simulate a 1-second delay before navigating to the next page
      await Future.delayed(Duration(seconds: 1));

      Navigator.pop(context); // Dismiss the loading indicator

      // Navigate to the next page (replace 'NextPage()' with your desired next page widget)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrgEvent()),
      );
    } else {
      print('Please select an event and an image before submitting.');
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
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.transparent)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                child: DropdownButton<String>(
                  value: selectedOption,
                  hint: Text('Select an option'),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption = newValue;
                    });
                  },
                  items: options.map<DropdownMenuItem<String>>(
                      (Map<String, dynamic> option) {
                    return DropdownMenuItem<String>(
                      value: option['value'].toString(),
                      child: Text(option['label']),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 23.h),
            Container(
              height: 200,
              width: double.infinity,
              color: Color.fromARGB(255, 246, 249, 252),
              child: InkWell(
                onTap: () {
                  _getImage();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.upload,
                      size: 25,
                      
                    ),
                     _imageName != null
                    ? Text(
                        _imageName!,
                        style: TextStyle(fontSize: 16),
                      )
                    : SizedBox()
                  ],
                ), 
                // Adjust spacing if needed
               
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
                  minimumSize: MaterialStatePropertyAll(Size(350.w, 50.h)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF204563))),
              onPressed: () {
                Fluttertoast.showToast(msg: 'Please wait...');
                _submitDataAndNavigate();
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text(
          'This is the next page after submitting!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
