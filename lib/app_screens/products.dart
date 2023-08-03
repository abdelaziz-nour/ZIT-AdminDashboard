import 'package:flutter/material.dart';
import 'package:zit_admin_screens/Mywidget/product__Info_Row.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';
import 'package:zit_admin_screens/app_screens/admin_board.dart';
import 'package:zit_admin_screens/app_screens/storeinfo.dart';
import 'package:zit_admin_screens/app_screens/stores.dart';
import 'package:zit_admin_screens/constant.dart';

class products extends StatefulWidget {
  products({required this.id});
  final String id;

  @override
  State<StatefulWidget> createState() {
    return productsState(id);
  }
}

class productsState extends State<products> {
  productsState(this.id);
  final String id;
  DatabaseHelper databaseHelper = DatabaseHelper();
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
              'المنتجات',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )),
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
                    width: 1440,
                    height: 70,
                    color: Colors.white,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [

                        isDesktop?
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(top:15,right: 250),
                            child: Text(
                              'اسم المنتج',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ):Container(),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding:  EdgeInsets.only(top:15,right:isDesktop? 60:20),

                            child: Text(
                              ' تصنيف المنتج ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            ' سعر المنتج',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: databaseHelper
                          .getStoreProducts(id: id)
                          .asStream(), // Replace with your own stream
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(); // Show a loading indicator while data is being fetched
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                      primary: false,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Productinforow(
                                snapshot.data![index]['Image'],
                                snapshot.data![index]['Name'],
                                snapshot.data![index]['Category'],
                                snapshot.data![index]['Price'].toString());
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
      );
  }) );
  }
}
