import 'package:flutter/material.dart';
import 'package:hostel_management_app/Pages/SearchPage.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopBar(),
                const SearchInput(),
                const PromoCard(),
                const Headline(),
                const CardListView(),
                const SHeadline(),
                const LikeListTile(
                    title: "PG Hostels",
                    likes: "4.8",
                    subtitle: "Good environment"),
                const LikeListTile1(
                    title: "Double Bed",
                    likes: "5.0",
                    subtitle: "The service was good"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hostel\nManagement",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.25)),
            ]),
            child: GestureDetector(
              onTap: () {
                AlertDialog alert = AlertDialog(
                  title: const Text('Dark Mode is coming soon!'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true).pop(),
                        child: const Text('OK')),
                  ],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.dark_mode,
                  size: 35,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 25.0, right: 25.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          onChanged: (value) {
            //Do something wi
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Search()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.redAccent])),
          child: Stack(
            children: [
              Image.asset("images/card.png"),
              const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    "Search your nearest Hostel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    "SALE: 50% off",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    "T&C applied",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Nearest Hostels",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "Check out the nearest Hostels",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          const Text(
            "View More",
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class SHeadline extends StatelessWidget {
  const SHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Popular Hostels",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              const Text(
                "There are some trending hostels",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          const Text(
            "View More",
            style: const TextStyle(
                color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Card("PG Hostels", "images/pg.png", "8 min away"),
            Card("Double Bed", "images/hostel.png", "12 min away"),
            Card("Shared Hostel", "images/h3.jpg", "15 min away"),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;

  Card(this.text, this.imageUrl, this.subtitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 15),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Image.asset(imageUrl, height: 70, fit: BoxFit.cover),
            const Spacer(),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class SocialPictureGroup extends StatelessWidget {
  const SocialPictureGroup({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.color,
    required this.onTap,
    this.width = 400,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final Color color;
  final Function onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.fitWidth,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  // color: Colors.red
                ),
                clipBehavior: Clip.antiAlias,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            width: width,
            child: LikeListTile1(
              title: "Andre Hirata",
              likes: "130",
              subtitle: "103 Reviews",
              color: color,
            ))
      ],
    );
  }
}

class LikeListTile extends StatelessWidget {
  const LikeListTile(
      {Key? key,
      required this.title,
      required this.likes,
      required this.subtitle,
      this.color = Colors.white})
      : super(key: key);
  final String title;
  final String likes;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      leading: Container(
        width: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"))),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.orange, size: 15),
          const SizedBox(width: 2),
          Text(likes),
          Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(width: 4, height: 4),
              )),
          Text(subtitle)
        ],
      ),
      trailing: LikeButton(onPressed: () {}, color: Colors.orange),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton(
      {Key? key, required this.onPressed, this.color = Colors.black12})
      : super(key: key);
  final Function onPressed;
  final Color color;
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.color),
      onPressed: () {
        setState(() {
          isLiked = !isLiked;
        });
        widget.onPressed();
      },
    ));
  }
}

class LikeListTile1 extends StatelessWidget {
  const LikeListTile1(
      {Key? key,
      required this.title,
      required this.likes,
      required this.subtitle,
      this.color = Colors.white})
      : super(key: key);
  final String title;
  final String likes;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      leading: Container(
        width: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg"))),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.orange, size: 15),
          const SizedBox(width: 2),
          Text(likes),
          Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: const SizedBox(width: 4, height: 4),
              )),
          Text(subtitle)
        ],
      ),
      trailing: LikeButton(onPressed: () {}, color: Colors.orange),
    );
  }
}

class LikeButton1 extends StatefulWidget {
  const LikeButton1(
      {Key? key, required this.onPressed, this.color = Colors.black12})
      : super(key: key);
  final Function onPressed;
  final Color color;
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState1 extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.color),
      onPressed: () {
        setState(() {
          isLiked = !isLiked;
        });
        widget.onPressed();
      },
    ));
  }
}
