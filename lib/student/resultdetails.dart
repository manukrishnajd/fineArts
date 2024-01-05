import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_arts/student/applyappeal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Resultdetails extends StatefulWidget {
  final String documentId;
  const Resultdetails({Key? key, required this.documentId}) : super(key: key);

  @override
  State<Resultdetails> createState() => _ResultdetailsState();
}

class _ResultdetailsState extends State<Resultdetails> {
  Map<String, dynamic> eventData = {};
    bool isLoading = true;
 @override
  void initState() {
    super.initState();
    fetchEventData();
  }

  Future<void> fetchEventData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('events').doc(widget.documentId).get();

      if (snapshot.exists) {
        setState(() {
          eventData = snapshot.data()!;
          isLoading=false;
        });
        print(eventData);
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });
    await fetchEventData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Event Results ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )),
      body: 
      isLoading
          ? Center(
              child: CircularProgressIndicator(),
            ):Padding(
        padding: const EdgeInsets.all(20).r,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 18.h,
          ),
          Center(
            child: Text(
              eventData['name'],
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
                    height: 32.h,
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
                    height: 32.h,
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
                    height: 30.h,
                  ),
                  // Text(
                  //   'Location',
                  //   style: TextStyle(
                  //     color: Color(0xFF1A1919),
                  //     fontSize: 15.sp,
                  //     fontFamily: 'Poppins',
                  //     fontWeight: FontWeight.w400,
                  //     height: 0,
                  //   ),
                  // )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventData['date'],
                    style: TextStyle(
                      color: Color(0xFFB8B1B1),
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
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
                    height: 32.h,
                  ),
                  Text(
                    eventData['time'],
                    style: TextStyle(
                      color: Color(0xFFB8B1B1),
                      fontSize: 13.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  // Text(
                  //   'Ground',
                  //   style: TextStyle(
                  //     color: Color(0xFFB8B1B1),
                  //     fontSize: 13.sp,
                  //     fontFamily: 'Poppins',
                  //     fontWeight: FontWeight.w400,
                  //     height: 0,
                  //   ),
                  // )
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
              fontSize: 18.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          Container(
            // width: 350.w,
            height: MediaQuery.of(context).size.height / 2.8,
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
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return ApplyAppeal();
                  },
                ));
              },
              child: Text(
                'Appeal',
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
