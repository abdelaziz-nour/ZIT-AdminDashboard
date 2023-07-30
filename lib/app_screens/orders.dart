
import 'package:flutter/material.dart';
import 'package:zit_admin_screens/Mywidget/order_info_Row.dart';
import '../api/apiRequests.dart';
import '../constant.dart';
import 'admin_board.dart';
import 'storeinfo.dart';
import 'stores.dart';
class orderscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return orderscreenState();
  }
}


class orderscreenState extends State<orderscreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final isDesktop = MediaQuery.of(context).size.width >= 1200;
    DatabaseHelper databaseHelper = DatabaseHelper();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Pcolor,
        title: const Center(
          child: Text(
            'جميع الطلبات',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: [
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
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth,
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          children: [
                            isDesktop
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: 15.0, right: isDesktop ? 50 : 20),
                                    child: Text(
                                      ' رقم الطلب',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Container(),
                            isDesktop
                                ? const Padding(
                                    padding:
                                        EdgeInsets.only(top: 15.0, right: 100),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      '  المتجر ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Container(),
                            isDesktop
                                ? const Padding(
                                    padding:
                                        EdgeInsets.only(top: 15.0, right: 150),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      '  المشتري ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Container(),
                            const Padding(
                              padding: EdgeInsets.only(top: 15.0, right: 200),
                              // ignore: prefer_const_constructors
                              child: Text(
                                ' تاريخ الطلب',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 15.0, right: 160),
                              // ignore: prefer_const_constructors
                              child: Text(
                                '  المبلغ ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder(
                        future: databaseHelper.getOrders(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length - 1,
                              itemBuilder: (context, itemIndex) {
                                return orderinforow(
                                  snapshot.data![itemIndex]['id'],
                                  snapshot.data![itemIndex]['Store'],
                                  snapshot.data![itemIndex]['CreatedBy'],
                                  snapshot.data![itemIndex]['CreatedOn'],
                                  snapshot.data![itemIndex]['Total'].toString(),
                                  snapshot.data![itemIndex]['OrderItems'],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
