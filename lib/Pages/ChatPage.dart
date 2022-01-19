import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            "Chat".text.xl4.bold.color(Colors.white).make().p16(),
          ],
        ),
      ),
    );
  }
}
