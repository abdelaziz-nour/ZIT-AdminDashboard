import 'package:flutter/material.dart';
import 'package:zit_admin_screens/Mywidget/allProduct_info_Row.dart';
import 'package:zit_admin_screens/Mywidget/order_info_Row.dart';

import '../constant.dart';
import 'admin_board.dart';
import 'storeinfo.dart';
import 'stores.dart';
class allProductscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return allProductscreenState();
  }
}
  class allProductscreenState extends State<allProductscreen>{
    
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
     final isDesktop =MediaQuery.of(context).size.width>=1200;
    final ismobile =MediaQuery.of(context).size.width<=600;
      
      
     
    return Scaffold(

      backgroundColor: Colors.white,
       appBar: AppBar(
          backgroundColor: Pcolor,
          title: const Center(
            child: Text(
              'جميع المنتجات',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )),
      body: LayoutBuilder(
        builder:(BuildContext context,BoxConstraints constraints){
          return   Row(children: [
            isDesktop?
          SizedBox(
            width: 200,
            height: screenHeight,
            child: Container(
              width: screenWidth / 3,
              height: screenHeight,
              color: Pcolor,
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'أهلاً بك',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const board();
                        }));
                      },
                      child: const Text(
                        'الرئيسيه',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.store,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const store();
                        }));
                      },
                      child: const Text(
                        'المتاجر',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Row(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return storeinfo();
                      }));
                    },
                    child: const Text(
                      'المستخدمين',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
                Row(children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.logout_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ]),
              ]),
            ),
          ):Container(),
           Expanded(
              flex: 5,
              child: Container(
                  width: 200,
                  height: screenHeight,
                  color: Colors.white,
                  child: Column(children: [
                    Container(
                      width: screenWidth,
                      height: 70,
                      color: Colors.white,
                      child: Row(
                        
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          isDesktop?
                           Padding(
                            
                            padding: EdgeInsets.only(top: 15.0, right:isDesktop?50:20),
                            child: Text(
                              ' رقم المنتج',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ):Container(),
                          isDesktop?
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0, right: 115),
                            // ignore: prefer_const_constructors
                            child: Text(
                              ' صورة المنتج  ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ):Container(),
                          isDesktop?
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0, right: 150),
                            // ignore: prefer_const_constructors
                            child: Text(
                              '  اسم المنتج ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ):Container(),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0, right: 200),
                            // ignore: prefer_const_constructors
                            child: Text(
                              '  السعر',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0, right: 160),
                            // ignore: prefer_const_constructors
                            child: Text(
                              '  المتجر ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  allproductinforow("1", "images/im.jpj.jpg", "منتج1", "6000", "عزيز")
                   ]) ))]
          );
          })
          );
          }}
