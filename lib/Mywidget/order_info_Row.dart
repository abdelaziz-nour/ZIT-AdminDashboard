import 'dart:html';
import 'package:flutter/material.dart';
import '../app_screens/order_item.dart';
import '../constant.dart';

class orderinforow extends StatelessWidget {
  final String ordernum;
  final String storename;
  final String Buyer;
  final String orderdate;
  final String orderamount;
  const orderinforow(
    this.ordernum, 
    this.storename, 
    this.Buyer, 
    this.orderdate,
     this.orderamount
    
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
      final isDesktop =MediaQuery.of(context).size.width>=600;
    final ismobile =MediaQuery.of(context).size.width<=600;

    return Container(
      // width: screenWidth,
      height: 70,
      color: Pcolor,
      child: Column(
        children: [
          InkWell(
            onTap:(() {
               Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return  orderitemscreen();
                                    }));
            }),         
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                isDesktop?
                Expanded(
                  flex: 5,
                  child: Padding(
                      padding: EdgeInsets.only(top: 12.0, right: 50,bottom: 10),
                    child: Text(
                      '$ordernum ',
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ):Container(),
                isDesktop?
                Expanded(
                  flex: 5,
                  child: Text(
                    '$storename ',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ):Container(),
                Expanded(
                  flex: 5,
                  child: Text(
                    '$Buyer',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    '$orderdate',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.0, right: 45,bottom: 10),
                    child: Text(
                      '$orderamount',
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
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
