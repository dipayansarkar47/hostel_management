import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hostel_management_app/Pages/1_Login/LogInPage.dart';
import 'package:hostel_management_app/Pages/1_Login/Signup.dart';
import 'package:hostel_management_app/Pages/2_Home/BottomNav.dart';
import 'package:hostel_management_app/Pages/ChatPage.dart';
import 'package:hostel_management_app/Pages/HostelDetailsPage.dart';
import 'package:hostel_management_app/Pages/1_Login/FirstPage.dart';
import 'package:hostel_management_app/Pages/ProfilePage.dart';
import 'package:hostel_management_app/Pages/SearchPage.dart';
import 'package:hostel_management_app/Routes/Routes.dart';
import 'package:velocity_x/velocity_x.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: BottomNavigations(),
      initialRoute: MyRoutes.firstPage,
      routes: {
        // '/': (context) => Home(),
        MyRoutes.home: (context) => BottomNavigations(),
        MyRoutes.firstPage: (context) => StudentorOwner(),
        MyRoutes.hosteldetails: (context) => HostelDetails(),
        MyRoutes.loginscreen: (context) => LogInScreen(),
        MyRoutes.SignUpScreen: (context) => SignUpScreen(),
      },
    );
  }
}
