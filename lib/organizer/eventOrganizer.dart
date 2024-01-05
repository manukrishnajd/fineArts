import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_arts/organizer/addresult.dart';
import 'package:fine_arts/organizer/eventDetails.dart';
import 'package:fine_arts/organizer/participentList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrgEvent extends StatefulWidget {
  const OrgEvent({super.key});

  @override
  State<OrgEvent> createState() => _OrgEventState();
}

class _OrgEventState extends State<OrgEvent> with TickerProviderStateMixin {

   List<Map<String, dynamic>> eventsData = [];

   @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
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
    } catch (e) {
      print('Error fetching events: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 88).h,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddResult(),
                    ));
              },
              child: Icon(
                CupertinoIcons.plus,
                color: Colors.white,
              ),
              backgroundColor: Color(0xFFFDBE40),
              shape: CircleBorder(),
            ),
          ),
          body: SafeArea(
            child: Column(children: [
              CustomTabBar(),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: TabBarView(physics: BouncingScrollPhysics(), children: [
                   Column(
            children: eventsData.map((event) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ParticipentList(),
                              ),
                            );
                          },
                          child: Container(
                            width: 350.w,
                            height: 50.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFF558DBA),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.w,
                                  color: Color(0xFF558DBA),
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                event['name'] ?? '', // Display event name
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
            
        
          ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventDetails(),
                              ));
                        },
                        child: Container(
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
            ]),
          )),
    );
  }

  Padding CustomTabBar() {
    return Padding(
      padding: const EdgeInsets.all(20).r,
      child: Container(
        height: 37.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r), color: Color(0x702276BB)),
        child: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Color(0xFFFDBE40)),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Center(
                  child: Text(
                    'Event',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Result',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
