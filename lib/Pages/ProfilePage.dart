import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            "Profile".text.xl4.bold.color(Colors.white).make().p16(),
          ],
        ),
      ),
    );
  }
}
