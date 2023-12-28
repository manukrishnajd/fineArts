import 'dart:async';

import 'package:fine_arts/student/student.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return Studentlogin();
          },
        ));
      });
      // navigatorToHome();
    }
//     navigatorToHome() async {
//       await Future.delayed(
//         Duration(milliseconds: 1500),
//         () {},
//       );
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Studentlogin(),
//           ));
//     }

    return Scaffold(
      backgroundColor: Color(0x702276BB),
      body: Center(
          child: Image.asset(
        'assets/image 1.png',
        height: MediaQuery.of(context).size.height / 6,
      )),
    );
  }
}
