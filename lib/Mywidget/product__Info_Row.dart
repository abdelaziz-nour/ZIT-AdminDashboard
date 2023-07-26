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
     final isDesktop =MediaQuery.of(context).size.width>=1200;
    final ismobile =MediaQuery.of(context).size.width<=600;
    return Container(
      width: 1440,
      height: 70,
      color: Pcolor,
      child: Column(
        children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              isDesktop?
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
              ):Container(),
              isDesktop?
              Expanded(
                
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0, right: 130),
                  child: Text(
                    '$productName ',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ):Container(),
              Expanded(
                flex: 3,
                child: Text(
                  '$productType ',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
               padding: EdgeInsets.only(top: 15.0, ),
                  child: Text(
                    '$productPrice',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
