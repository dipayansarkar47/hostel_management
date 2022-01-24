import 'package:flutter/material.dart';
import 'package:hostel_management_app/Pages/1_Login/LogInPage.dart';

class StudentorOwner extends StatefulWidget {
  const StudentorOwner({Key? key}) : super(key: key);

  @override
  _StudentorOwnerState createState() => _StudentorOwnerState();
}

class _StudentorOwnerState extends State<StudentorOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.orangeAccent,
                  Colors.red,
                ],
              )),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.all(10),
                      child: Text('Log in as Student',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInScreen()));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(' Log in as Owner ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LogInScreen()));
                      },
                    ),
                  ],
                ),
              ))),
    );
  }
}
