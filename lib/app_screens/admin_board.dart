

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zit_admin_screens/app_screens/storeinfo.dart';
import 'package:zit_admin_screens/app_screens/stores.dart';
import 'package:zit_admin_screens/constant.dart';

class board extends StatefulWidget {
  const board({super.key});

  @override
  State<StatefulWidget> createState() {
    return boardState();
  }
}
  class boardState extends State<board>{
  
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
    //  final isdesktop=MediaQuery.of(context).size.width>=900;
    //  final ismobile=MediaQuery.of(context).size.width<1280;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pcolor,
        title:const Center(
          child: Text('الرئيسيه',
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
              width: 15.w,
              height: 700.h,
              child: Container(
              width:15.w,
              //screenWidth/3,
              height: 700.h,
              color: Pcolor,
              child: Column(children: [
                 Padding(
                  padding: EdgeInsets.only(top:5.h,right:1.h ),
                  child: Text('أهلاً بك',
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontStyle: FontStyle.italic,
                    color:Colors.white,
                  ),),
                ),
                Row(
                  children:  [
                    Padding(
                      padding: EdgeInsets.all(1.5.h),
                      child: Icon(Icons.home,
                      color: Colors.white,
                      size: 6.sp,),
                    ),
                    Text('الرئيسيه',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 4.sp
                    ),)
                  ],
                ),
                 Row(
                  children:  [
                    Padding(
                      padding: EdgeInsets.all(1.5.h),
                      child: Icon(Icons.store,
                      color: Colors.white,
                      size: 6.sp,),
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                     return  const store();
   } ));},
                      child: Text('المتاجر',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 4.sp
                      ),),
                    )
                  ],
                ),
                Row(
                  children:  [
                    Padding(
                      padding: EdgeInsets.all(1.5.h),
                      child: Icon(Icons.person,
                      color: Colors.white,
                      size: 6.sp,),
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                     return storeinfo ();
                       })); },
                      child: Text('المستخدمين',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 4.sp
                      ),),
                    )
              ]),
               Row(
                  children:  [
                    Padding(
                      padding: EdgeInsets.all(1.5.h),
                      child: Icon(Icons.logout_sharp,
                      color: Colors.white,
                      size: 6.sp,),
                    ),
                    Text('تسجيل الخروج',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 4.sp
                      
                      
                    ),)
              ]),
           ] ),
            
          ),),
          
               Expanded(
               // flex:5,
                 child: Container(
                   width: 700.h,
                   height: 700.h,
                   color: Colors.white,
                   child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right: 30.0.h,top: 15.h),
                          child: Container(
                            width: 13.w,
                            height: 17.h,
                            child: Row(
                              children: [
                                Icon(Icons.storefront_outlined,
                                color: Colors.white,
                                size: 6.sp,),
                                Padding(
                                  padding:  EdgeInsets.all(2.5.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push( context, MaterialPageRoute(builder: (context){
                                      return const store ();})); 
                                    },
                                    child: Text("المتاجر",
                                    style: TextStyle(
                                      color: Colors.white,
                                    
                                      fontSize: 5.sp
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
                            color: const Color.fromARGB(255, 234, 160, 133)
                            
                            ),
                           ),
                        ),
                         Padding(
                          padding:  EdgeInsets.only(right: 15.0.h,top: 15.h),
                          child: Container(
                            width: 13.w,
                            height: 17.h,
                            child: Row(
                              children: [
                                Icon(Icons.person,
                                color: Colors.white,
                                size: 4.sp,),
                                Padding(
                                  padding:  EdgeInsets.all(1.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push( context, MaterialPageRoute(builder: (context){
                                      return storeinfo ();})); 
                                    },
                                    child: Text("المستخدمين",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 5.sp
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
                            color: const Color.fromARGB(255, 227, 136, 102)
                            
                            ),
                           ),
                        ),
                      
                    
                 
                   ]),
                     Row(
                      children: [
                       Padding(
                          padding:  EdgeInsets.only(right: 30.0.h,top: 15.h),
                          child: Container(
                            width: 13.w,
                            height: 17.h,
                            child: Row(
                              children: [
                                Icon(Icons.storefront_outlined,
                                color: Colors.white,
                                size: 6.sp,),
                                Padding(
                                  padding:  EdgeInsets.all(2.5.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push( context, MaterialPageRoute(builder: (context){
                                      return const store ();})); 
                                    },
                                    child: Text("",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 5.sp
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
                            color: const Color.fromARGB(255, 236, 180, 160)
                            
                            ),
                           ),
                        ),
                    Padding(
                          padding:  EdgeInsets.only(right: 15.0.h,top: 15.h),
                          child: Container(
                            width: 13.w,
                            height: 17.h,
                            child: Row(
                              children: [
                                Icon(Icons.storefront_outlined,
                                color: Colors.white,
                                size: 6.sp,),
                                Padding(
                                  padding:  EdgeInsets.all(2.5.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push( context, MaterialPageRoute(builder: (context){
                                      return const store ();})); 
                                    },
                                    child: Text("",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 5.sp
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
                            color:Pcolor
                            
                            ),
                           ),
                        ),

      
      ]) 
           ]))
      )])
      );}}