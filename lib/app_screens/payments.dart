import 'package:flutter/material.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';
import 'package:zit_admin_screens/app_screens/admin_board.dart';
import 'package:zit_admin_screens/app_screens/storeinfo.dart';
import 'package:zit_admin_screens/app_screens/stores.dart';
import 'package:zit_admin_screens/constant.dart';

import '../Mywidget/payments_Info_Row.dart';

class payments extends StatefulWidget {
  payments({required this.id});
  final int id;
  @override
  State<StatefulWidget> createState() {
    return paymentsState(id);
  }
}

class paymentsState extends State<payments> {
  paymentsState(this.id);
  final int id;
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Pcolor,
            title: const Center(
              child: Text(
                'الدفعيات',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )),
        body: Row(children: [
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
          ),
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
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0, right: 50),
                            child: Text(
                              'اسم المنتج',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0, right: 100),
                            // ignore: prefer_const_constructors
                            child: Text(
                              '  الكميه ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0, right: 150),
                            // ignore: prefer_const_constructors
                            child: Text(
                              ' سعر المنتج ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0, right: 200),
                            // ignore: prefer_const_constructors
                            child: Text(
                              ' تاريخ البيع',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0, right: 200),
                            // ignore: prefer_const_constructors
                            child: Text(
                              '  المشتري',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder(
                        stream: databaseHelper
                            .getStoreOrders(id: id)
                            .asStream(), // Replace with your own stream
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator(); // Show a loading indicator while data is being fetched
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.length - 1,
                            itemBuilder: (context, index) {
                              var order = snapshot.data![index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: order['OrderItems'].length,
                                    itemBuilder: (context, itemIndex) {
                                      var orderItem =
                                          order['OrderItems'][itemIndex];
                                      return paymentsinforow(
                                          orderItem['ProductName'],
                                          orderItem['Quantity'].toString(),
                                          orderItem['Price'],
                                          order['CreatedOn'],
                                          order['CreatedBy']);
                                    },
                                  ),
                                  Divider(),
                                ],
                              );
                            },
                          );

                        },
                      ),
                    ),
                  ])))
        ]));
  }
}
