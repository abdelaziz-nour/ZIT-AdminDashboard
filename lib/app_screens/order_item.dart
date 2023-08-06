import 'package:flutter/material.dart';
import 'package:zit_admin_screens/Mywidget/item_table.dart';
import 'package:zit_admin_screens/Mywidget/order_info_Row.dart';

import '../constant.dart';
import 'admin_board.dart';
import 'storeinfo.dart';
import 'stores.dart';


class orderitemscreen extends StatefulWidget {
  orderitemscreen(this.OrderItems);
  final List OrderItems;
  @override
  State<StatefulWidget> createState() {
    return orderitemscreenState(OrderItems);
  }
}

class orderitemscreenState extends State<orderitemscreen> {
  orderitemscreenState(this.OrderItems);
  final List OrderItems;
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 600;
    final ismobile = MediaQuery.of(context).size.width <= 600;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Pcolor,
            title: const Center(
              child: Text(
                'معلومات الطلب',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Row(children: [
            isDesktop
                ? SizedBox(
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
                  )
                : Container(),
            Expanded(
                flex: 5,
                child: Container(
                    width: screenWidth,
                    height: screenHeight,
                    color: Colors.white,
                    child: orderitemWidget(
                             OrderItems: OrderItems,)
                    
         ) )]);
        }));
  }
}

