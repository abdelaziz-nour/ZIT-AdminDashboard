

import 'package:flutter/material.dart';
import 'package:zit_admin_screens/Mywidget/store_Info_Row.dart';
import 'package:zit_admin_screens/app_screens/container.dart';
import 'package:zit_admin_screens/constant.dart';

import 'admin_board.dart';
import 'stores.dart';

class storeinfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return storeinfoState();
  }
}
  class storeinfoState extends State<storeinfo>{
    var Container1 =Containerr();
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pcolor,
        title:const Center(
          child: Text('المستخدمين',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white, 
          ),),
        )
      ),
      body: Row(
           children: [
             SizedBox(
              width: 200,
              height: screenHeight,
              child: Container(
              width: screenWidth/3,
              height: screenHeight,
              color: Pcolor,
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('أهلاً بك',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color:Colors.white,
                  ),),
                ),
                Row(
                  children:  [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.home,
                      color: Colors.white,),
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                     return board ();
  }));  },
                      child: Text('الرئيسيه',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    )
                  ],
                ),
                 Row(
                  children:  [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.store,
                      color: Colors.white,),
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                     return store ();}));},
                      
                      child: Text('المتاجر',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    )
                  ],
                ),
                Row(
                  children:  [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.person,
                      color: Colors.white,),
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                     return storeinfo ();}));},
                      
                      child: Text('المستخدمين',
                      style: const TextStyle(
                        color: Colors.white,
                      ),),
                    )
              ]),
               Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.logout_sharp,
                      color: Colors.white,),
                    ),
                    Text('تسجيل الخروج',
                    style: TextStyle(
                      color: Colors.white,
                      
                    ),)
              ]),
           ] ),
            
          ),),
               Expanded(
                flex:5 ,
                 child: Container(
                   width: 200,
                   height: screenHeight,
                   color: Colors.white,
                   child: Column(
                    children: [
                      Container(
                        width: screenWidth,
                        height: 70,
                        color: Colors.white,
                        child:  Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Padding(
                              padding:  EdgeInsets.only(top:15.0,right:100),
    
                              child: Text('اسم المستخدم',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                             const Padding(
                              padding:  EdgeInsets.only(top:15.0,right:200),
                              // ignore: prefer_const_constructors
                              child: Text('البريد الالكتروني ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                             const Padding(
                              padding:  EdgeInsets.only(top:15.0,right:200),
                              // ignore: prefer_const_constructors
                              child: Text('اسم المتجر',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                            )
                          ],
                         ),
                      ),
                      ///
                      ///
                      storeinforow("دعاش", "d@gmail.com", "زول اي تي"),
                      storeinforow("دعاش", "d@gmail.com", "زول اي تي"),
                  
                    ],

                   ),
                  
                 ),
               ),
              
            
           ],
            ),
           
      );
        
      
      }}