import 'dart:html';
import 'package:flutter/material.dart';
import '../constant.dart';

class  paymentsinforow extends StatelessWidget{
   final String productName; 
   final String Quantity; 
   final String ProductPrice;
   final String DateOfSale;
   final String Buyer;
const paymentsinforow( this.productName,this.Quantity,this.ProductPrice,this.DateOfSale,this.Buyer, );
  

 @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
   return  Container(
                       // width: screenWidth,
                        height: 70,
                        color: Pcolor,
                        child:  Column(
                          children: [
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                 Padding(
                                  padding:  EdgeInsets.only(top:10.0,right:60,bottom: 8),
    
                                  child: Text('$productName ',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                  Padding(
                                  padding:  EdgeInsets.only(top:10.0,right:120,bottom: 8),
                                  // ignore: prefer_const_constructors
                                  child: Text('$Quantity ',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                  Padding(
                                  padding:  EdgeInsets.only(top:10.0,right:190,bottom: 8),
                                  // ignore: prefer_const_constructors
                                  child: Text('$ProductPrice',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                          Padding(
                                    padding: const EdgeInsets.only(right:220, top: 10,bottom: 8),
                                    child: Text('$DateOfSale',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                   Padding(
                                    padding: const EdgeInsets.only(right: 200, top: 10,bottom: 8),
                                    child: Text('$Buyer',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                  
                              ],
                             ),
                               Expanded(
                                
                                child: Container(
                                // width: screenWidth,
                                 height: 70,
                                 color: Colors.white
                                ),
                              )
                            
                          ],
                        ),
                      );

     }}