import 'dart:html';

import 'package:flutter/material.dart';
import 'package:zit_admin_screens/app_screens/payments.dart';
import 'package:zit_admin_screens/app_screens/products.dart';


import '../constant.dart';

class   Storecard extends StatelessWidget{
   final String image; 
   final String StoreName;
   final String StoreManagerName;

  const Storecard(this.image,this.StoreName,this.StoreManagerName, );
  
  // ignore: empty_constructor_bodies
 @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment:Alignment.bottomCenter,
      children: [
        Padding(
          padding:  EdgeInsets.all(100),
          child: Container(
            
            height:200,
            width: 200,
            decoration: const BoxDecoration(
              
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft:  Radius.circular(30),
                bottomRight: Radius.circular(30),), 
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,15),
                  blurRadius: 25,
                  color: Colors.black12,
                )
              ]
            ),

          ),
        ),
         Positioned(
          top: 25,
          left: 40,
          right: 40,
          child: Container(
            padding:const EdgeInsets.symmetric(
              horizontal: 20,),
              height: 150,
              width: 190,
              child:
                 CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color.fromARGB(255, 247, 246, 246),
                   child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),             
                     child: Image.asset("$image",
                     width: 100,
                     height: 150,
                     
                                   ),
                   ),
                 ),
              )

     ),
          Positioned(
            top:200,
            child: Column(
              children:[
                Row(
                  children: [
                    Text(' اسم المتجر:',
                    style: TextStyle(
                      color: Pcolor,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('$StoreName',
                    style: TextStyle(
                      color: Pcolor,
                    ),),
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                    children: [
                      Text(' اسم المالك:',
                      style: TextStyle(
                        color: Pcolor,
                        fontWeight: FontWeight.bold
                      ),),
                      Text('$StoreManagerName',
                      style: TextStyle(
                        color: Pcolor,
                      ),),
                    ],
                ),
                
                 ),
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                   Color.fromARGB(255, 52, 108, 126)),
                              //end coloring
                              //start bordering
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )) ),
              child:  Text(
                'المنتجات',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                ),
               onPressed: () {
                    Navigator.push( context, MaterialPageRoute(builder: (context){
                     return products ();}));
                  },
                
               
           ),
                    ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                     Color.fromARGB(255, 52, 108, 126)),
                              //end coloring
                              //start bordering
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )) ),
                child:  Text(
                  'الدفعيات',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                 onPressed: () {
                   Navigator.push( context, MaterialPageRoute(builder: (context){
                     return payments ();}));
                  },
                  
                 
             ),
           ),
                  ],
                 )
               
      ]),
                

     ) ],
            );
    }}