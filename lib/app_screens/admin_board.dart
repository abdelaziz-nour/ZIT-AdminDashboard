import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';
import 'package:zit_admin_screens/app_screens/allproduct.dart';
import 'package:zit_admin_screens/app_screens/orders.dart';
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

class boardState extends State<board> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final isDesktop = MediaQuery.of(context).size.width >= 800;
    final ismobile = MediaQuery.of(context).size.width <= 600;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Pcolor,
            title: const Center(
              child: Text(
                'الرئيسيه',
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
                    width: 700,
                    height: 700,
                    color: Colors.white,
                    child: Column(children: [
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: screenWidth / 4, top: screenHeight / 4),
                          child: Container(
                            width: 141,
                            height: 141,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.storefront_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10, top: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const store();
                                      }));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "المتاجر",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color:
                                    const Color.fromARGB(255, 234, 160, 133)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: screenWidth / 7, top: screenHeight / 4),
                          child: Container(
                            width: 141,
                            height: 141,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return storeinfo();
                                      }));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "المستخدمين",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color:
                                    const Color.fromARGB(255, 227, 136, 102)),
                          ),
                        ),
                      ]),
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: screenWidth / 4, top: screenHeight / 6),
                          child: Container(
                            width: 141,
                            height: 141,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.production_quantity_limits_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return allProductscreen();
                                    }));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "جميع المنتجات",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color:
                                    const Color.fromARGB(255, 236, 180, 160)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: screenWidth / 7, top: screenHeight / 6),
                          child: Container(
                            width: 141,
                            height: 141,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.list,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                GestureDetector(
                                  onTap: ()  {
                                    
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return orderscreen();
                                    }));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "جميع الطلبات",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: Pcolor),
                          ),
                        ),
                      ])
                    ])))
          ]);
        }));
  }
}
