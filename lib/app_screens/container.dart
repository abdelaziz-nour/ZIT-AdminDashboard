import 'package:flutter/material.dart';
import 'package:zit_admin_screens/constant.dart';

class Containerr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContainerrState();
  }
}
  class ContainerrState extends State<Containerr>{
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Padding(
        padding:  EdgeInsets.only(left:screenWidth/1.2,top:1),
        child: Container(
          
         // height: screenHeight,
          width: 150,
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
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.home,
                  color: Colors.white,),
                ),
                Text('الرئيسيه',
                style: TextStyle(
                  color: Colors.white,
                ),)
              ],
            ),
             Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.store,
                  color: Colors.white,),
                ),
                Text('المتاجر',
                style: TextStyle(
                  color: Colors.white,
                ),)
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.person,
                  color: Colors.white,),
                ),
                Text('المستخدمين',
                style: TextStyle(
                  color: Colors.white,
                ),)
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
        
      ),
      
    ) ,
    );}}