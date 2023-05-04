import 'dart:html';

import 'package:flutter/material.dart';

import '../constant.dart';

class Productinforow extends StatelessWidget {
  final String image;
  final String productName;
  final String productType;
  final String productPrice;

  const Productinforow(
    this.image,
    this.productName,
    this.productType,
    this.productPrice,
  );

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: 1440,
      height: 70,
      color: Pcolor,
      child: Column(
        children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 65,
                width: 90,
                child: Image.network(
                  "http://vzzoz.pythonanywhere.com$image",
                  width: 100,
                  height: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 150, bottom: 8),
                child: Text(
                  '$productName ',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 150, bottom: 8),
                // ignore: prefer_const_constructors
                child: Text(
                  '$productType ',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, right: 150, bottom: 8),
                // ignore: prefer_const_constructors
                child: Text(
                  '$productPrice',
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
  }
}
