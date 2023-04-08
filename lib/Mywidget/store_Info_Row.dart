import 'dart:html';

import 'package:flutter/material.dart';


import '../constant.dart';

class   storeinforow extends StatelessWidget{
   final String username; 
   final String email;
   final String StoreName;

  const storeinforow(this.username,this.email,this.StoreName, );
  
  // ignore: empty_constructor_bodies
 @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
    return  LayoutBuilder(
        builder:(BuildContext context,BoxConstraints constraints){
    return Container(
                       // width: screenWidth,
                        height: 70,
                        color: Pcolor,
                        child:  Column(
                          children: [
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                 Padding(
                                  padding:  EdgeInsets.only(top:10.0,right:100,bottom: 8),
    
                                  child: Text('$username ',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                  Padding(
                                  padding:  EdgeInsets.only(top:10.0,right:250,bottom: 8),
                                  // ignore: prefer_const_constructors
                                  child: Text('$email ',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                  Padding(
                                  padding:  EdgeInsets.only(top:10.0,right:210,bottom: 8),
                                  // ignore: prefer_const_constructors
                                  child: Text('$StoreName',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                          Padding(
                                    padding: const EdgeInsets.only(right: 100.0, top: 10,bottom: 8),
                                    child: ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                   Colors.white),
                                //end coloring
                                //start bordering
                                shape:
                                      MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                )) ),
              child:  Text(
                'حذف',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Pcolor
                ),
                ),
               onPressed: () {
                
               }
           ),
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
    
}); }}