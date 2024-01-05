import 'package:fine_arts/admin/AdminOrgnizer.dart';
import 'package:fine_arts/admin/adminLogin.dart';
import 'package:fine_arts/organizer/organizerLogin.dart';
import 'package:fine_arts/organizer/organizerRegistration.dart';
import 'package:fine_arts/splash.dart';
import 'package:fine_arts/student/studenhome.dart';
import 'package:fine_arts/student/student.dart';
import 'package:fine_arts/student/studentregistration.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: OrganizerLogin()),
    );
  }
}
