import 'dart:html';
import 'package:flutter/material.dart';
import '../constant.dart';

class paymentsinforow extends StatelessWidget {
  final String productName;
  final String Quantity;
  final String ProductPrice;
  final String DateOfSale;
  final String Buyer;
  const paymentsinforow(
    this.productName,
    this.Quantity,
    this.ProductPrice,
    this.DateOfSale,
    this.Buyer,
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      // width: screenWidth,
      height: 70,
      color: Pcolor,
      child: Column(
        children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                    padding: EdgeInsets.only(top: 12.0, right: 50,bottom: 10),
                  child: Text(
                    '$productName ',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  '$Quantity ',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  '$ProductPrice',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  '$DateOfSale',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(top: 12.0, right: 100,bottom: 10),
                  child: Text(
                    '$Buyer',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            
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
