import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:hexcolor/hexcolor.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#FFFFFF"),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            "Search".text.xl4.bold.color(Colors.black).make().p16(),
          ],
        ),
      ),
    );
  }
}
