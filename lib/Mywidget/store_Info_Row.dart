import 'dart:html';

import 'package:flutter/material.dart';

import '../constant.dart';

class storeinforow extends StatelessWidget {
  final String username;
  final String email;
  final String StoreName;

  const storeinforow(
    this.username,
    this.email,
    this.StoreName,
  );

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        // width: screenWidth,
        height: 70,
        color: Pcolor,
        child: Column(
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 100, bottom: 8),
                  child: Text(
                    '$username ',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 250, bottom: 8),
                  // ignore: prefer_const_constructors
                  child: Text(
                    '$email ',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 210, bottom: 8),
                  // ignore: prefer_const_constructors
                  child: Text(
                    '$StoreName',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  // width: screenWidth,
                  height: 70,
                  color: Colors.white),
            )
          ],
        ),
      );
    });
  }
}
