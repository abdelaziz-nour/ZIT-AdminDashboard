import 'dart:html';
import 'package:flutter/material.dart';
import '../constant.dart';

class allproductinforow extends StatelessWidget {
  final String productnum;
  final String productimage;
  final String productname;
  final String productprice;
  final String productStore;

  const allproductinforow(
    this.productnum, 
    this.productimage, 
    this.productname, 
    this.productprice,
     this.productStore
    
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
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [

              isDesktop
                  ? Expanded(
                      flex: 5,
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 12.0, right: 80, bottom: 10),
                        child: Text(
                          '$productnum ',
                          // ignore: prefer_const_constructors
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : Container(),
              isDesktop
                  ? Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 10,
                          left: 75,
                        ),
                        height: 70,
                        width: 100,
                        child: Image.network(
                          "https://vzzoz.pythonanywhere.com$productimage",
                          width: 100,
                          height: 150,
                        ),
                      ))
                  : Container(),

              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text(
                    '$productname',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: Text(
                    '$productprice',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(

                  padding: EdgeInsets.only(top: 12.0, right: 100,bottom: 10),

                  child: Text(
                    '$productStore',
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
