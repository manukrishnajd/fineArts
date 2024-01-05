import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_arts/student/eventdetails.dart';
import 'package:fine_arts/student/resultdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Studenthome extends StatefulWidget {
  const Studenthome({super.key});

  @override
  State<Studenthome> createState() => _StudenthomeState();
}

class _StudenthomeState extends State<Studenthome> {
  List<Map<String, dynamic>> eventsData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<dynamic> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String organizerId = prefs.getString('studentId') ?? '';

    if (organizerId.isNotEmpty) {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('events').get();

      var eventData = querySnapshot.docs;

      if (eventData.isNotEmpty) {
        
          eventsData = eventData.map((doc) {
            var data = doc.data() as Map<String, dynamic>;
            data['docId'] = doc.id; // Include the documentId in the event data
            return data;
          }).toList();
          print(eventsData);
    
      } else {
        print('No events found for organizer: $organizerId');
      }
    } else {
      print('Organizer ID is empty');
    }
    return eventsData;
  }

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
                  FutureBuilder(
                      future: fetchData(),
                      builder: (context, snap) {
                        if (snap.hasData) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: eventsData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                       String documentId = eventsData[index]['docId'] ?? '';
                                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                                        return Eventdetails(documentId:documentId);
                                      },));
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
                                          eventsData[index]['name'],
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
                                );
                              },
                              
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  SizedBox(
                    height: 20.h,
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
