import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParticipentList extends StatefulWidget {
  final String documentId;

  const ParticipentList({Key? key, required this.documentId}) : super(key: key);

  @override
  State<ParticipentList> createState() => _ParticipentListState();
}

class _ParticipentListState extends State<ParticipentList> {
  List<Map<String, dynamic>> participants = [];

  @override
  void initState() {
    super.initState();
    fetchParticipants();
  }

  Future<void> fetchParticipants() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
          .instance
          .collection('EventRegistration')
          .where('eventId', isEqualTo: widget.documentId)
          .get();

      List<Map<String, dynamic>> tempParticipants = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot
          in querySnapshot.docs) {
        String studentId = docSnapshot.get('studentId');
        DocumentSnapshot<Map<String, dynamic>> studentSnapshot =
            await FirebaseFirestore.instance
                .collection('students')
                .doc(studentId)
                .get();

        if (studentSnapshot.exists) {
          Map<String, dynamic> studentData = studentSnapshot.data()!;
          tempParticipants.add(studentData);
        }
      }

      setState(() {
        participants = tempParticipants;
      });
    } catch (e) {
      print('Error fetching participants: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Participants List',
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
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: ListView.builder(
          itemCount: participants.length,
          itemBuilder: (BuildContext context, int index) {
            return customContainer(
              participants[index]['name'],
              participants[index]['idNumber'],
            );
          },
        ),
      ),
    );
  }

  Container customContainer(String name, String idNumber) {
    return Container(
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
        child: Row(
          children: [
            Image.asset('assets/user2.1.png'),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Color(0xFF1A1919),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  idNumber,
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
    );
  }
}
