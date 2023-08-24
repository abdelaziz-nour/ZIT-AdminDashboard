import 'package:flutter/material.dart';
import 'package:zit_admin_screens/Mywidget/store_Info_Row.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';
import 'package:zit_admin_screens/constant.dart';

import 'admin_board.dart';
import 'stores.dart';

class storeinfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return storeinfoState();
  }
}

class storeinfoState extends State<storeinfo> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  

  Future<List> usersFuture = DatabaseHelper().getUsers().asStream().toList();

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
     final isDesktop =MediaQuery.of(context).size.width>=1200;
    final ismobile =MediaQuery.of(context).size.width<=600;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pcolor,
        title: const Center(
          child: Text(
            'المستخدمين',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body:LayoutBuilder(
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
              child: Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: 70,
                    color: Colors.white,
                    child: Row(
                      children: [
                            isDesktop
                            ?  Padding(
                                padding: EdgeInsets.only(top: 15.0, right:screenWidth/10),
                                child: Text(
                                  'اسم المستخدم',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                        isDesktop?
                         Padding(
                          padding: EdgeInsets.only(top: 15.0, right: screenWidth/11),

                          child: Text(
                            'البريد الالكتروني ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ):Container(),
                         Padding(
                          padding: EdgeInsets.only(top: 15.0, right:isDesktop? screenWidth/10:screenWidth/3),

                          // ignore: prefer_const_constructors
                          child: Text(
                            'اسم المتجر',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.only(top: 15.0, right: screenWidth/10),
                          // ignore: prefer_const_constructors
                          child: Text(
                            ' حالة المتجر',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: databaseHelper
                          .getUsers()
                          .asStream(), // Replace with your own stream
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: const CircularProgressIndicator(
                              color: Pcolor,
                            ));
                        }

                        // Use the stored user data here
                        List usersData = snapshot.data ?? [];
                      
                        return ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: usersData.length,
                          itemBuilder: (context, index) {
                            return storeinforow(

                              usersData[index]['id'].toString(),
                              usersData[index]['UserName'],
                              usersData[index]['Email'],
                              usersData[index]['Store'],
                              usersData[index]['StoreDeletion'].toString(),
                              usersData[index]['StoreID'],


                            );
                            

                              

                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
  );}));}
       
  }

