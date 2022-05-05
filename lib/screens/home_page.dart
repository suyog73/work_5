// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_5/models/user.dart';
import 'package:work_5/provider/position_provider.dart';

String content =
    "I would very much like another lockdown. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = User(
    gender: "Female",
    imageUrl: "assets/images/app.png",
    name: "Aditi, 23",
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: size.height * 0.08,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    Image(
                      image: AssetImage("assets/images/logo.png"),
                      width: 32,
                      height: 32,
                    ),
                    Image(
                      image: AssetImage("assets/images/slider.png"),
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Draggable(
                    feedback: Material(
                      type: MaterialType.transparency,
                      child: MyCard(user: user),
                    ),
                    child: MyCard(user: user),
                    childWhenDragging: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Bio",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 6),
                  Text(
                    content,
                    style: TextStyle(
                      // fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    // bool isLeft = Provider.of<PositionProvider>(context).isLeft;
    // bool isRight = Provider.of<PositionProvider>(context).isRight;

    // Color color = isLeft
    //     ? Colors.red
    //     : isRight
    //         ? Colors.green
    //         : Colors.black;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(21),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(user.imageUrl), fit: BoxFit.fitWidth),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1],
                  ),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        user.gender,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        Positioned(
          top: 16,
          child: Image(
            image: AssetImage("assets/images/group.png"),
            width: 32,
          ),
        ),
      ],
    );
  }
}
