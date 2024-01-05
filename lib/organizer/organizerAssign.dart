// import 'dart:html';

import 'package:fine_arts/organizer/EditEvent.dart';
import 'package:fine_arts/organizer/appealList.dart';
import 'package:fine_arts/organizer/eventOrganizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OrgAssign extends StatefulWidget {
  const OrgAssign({Key? key});

  @override
  State<OrgAssign> createState() => _OrgAssignState();
}

class _OrgAssignState extends State<OrgAssign>
    with TickerProviderStateMixin {
  List<Map<String, dynamic>> eventsData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  
Future<void> fetchData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String organizerId = prefs.getString('organizerDocId') ?? '';

  if (organizerId.isNotEmpty) {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('events')
        .where('organiserId', isEqualTo: organizerId)
        .get();

    var eventData = querySnapshot.docs;

    if (eventData.isNotEmpty) {
      setState(() {
        eventsData = eventData.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          data['docId'] = doc.id; // Include the documentId in the event data
          return data;
        }).toList();
        print(eventsData);
      });
    } else {
      print('No events found for organizer: $organizerId');
    }
  } else {
    print('Organizer ID is empty');
  }
}


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: TabBarView(children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 56,
                        ),
                        customContainer(),
                      ],
                    ),
                    OrgEvent(),
                    Column(
                      children: [
                        SizedBox(
                          height: 52.h,
                        ),
                        Text(
                          'Appeal',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppealList(),
                                ));
                          },
                          child: Container(
                            width: 350.w,
                            height: 50.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 28),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.w, color: Color(0xFF558DBA)),
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
                          padding:
                              EdgeInsets.symmetric(vertical: 7, horizontal: 28),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.w, color: Color(0xFF558DBA)),
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
                    )
                  ]),
                )
              ],
            ),


            
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                // padding: EdgeInsets.all(10.w),
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: Color(0xFF204563)),
                child: TabBar(
                    indicatorPadding:
                        EdgeInsets.only(left: 0, top: 15, bottom: 15),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                        shape: BoxShape.rectangle,
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
                        child: SizedBox(
                          width: 72.w,
                          child: Center(
                            child: Text(
                              'Assigned',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Center(
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
                      ),
                      Tab(
                        child: Center(
                          child: Text(
                            'Appeal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
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

  Text cutomText() => Text('hellow');

  // Padding CustomTabBar() {
  //   return Padding(
  //     padding: const EdgeInsets.all(20).r,
  //     child: Container(
  //       height: 37.h,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(6.r), color: Color(0x702276BB)),
  //       child: TabBar(
  //           indicator: BoxDecoration(
  //               borderRadius: BorderRadius.circular(6.r),
  //               color: Color(0xFFFDBE40)),
  //           indicatorSize: TabBarIndicatorSize.tab,
  //           labelColor: Colors.white,
  //           unselectedLabelColor: Colors.black,
  //           controller: TabController(length: 2, vsync: this),
  //           tabs: [
  //             Tab(
  //               child: Center(
  //                 child: Text(
  //                   'Event',
  //                   style: TextStyle(
  //                     fontSize: 18.sp,
  //                     fontFamily: 'Poppins',
  //                     fontWeight: FontWeight.w500,
  //                     height: 0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Tab(
  //               child: Text(
  //                 'Result',
  //                 style: TextStyle(
  //                   fontSize: 18.sp,
  //                   fontFamily: 'Poppins',
  //                   fontWeight: FontWeight.w500,
  //                   height: 0,
  //                 ),
  //               ),
  //             )
  //           ]),
  //     ),
  //   );

   Padding customContainer() {
    List<Widget> eventWidgets = eventsData.map((event) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
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
                    event['name'] ?? '', // Display event name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Text(
                'Date   : ${event['date'] ?? ''}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Text(
                'Time   : ${event['time'] ?? ''}',
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
                    'Stage : ${event['stage'] ?? ''}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      String documentId = event['docId'] ?? '';
                      // Handle edit event action
                      print(documentId);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditEvent(documentId: documentId,),
                        ),
                      );
                    },
                    child: Icon(Icons.edit_square),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: eventWidgets,
      ),
    );
  }
}