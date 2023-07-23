import 'dart:html';

import 'package:flutter/material.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';

import '../constant.dart';

class storeinforow extends StatelessWidget {
  final int id;
  final String username;
  final String email;
  final String StoreName;
  final String Storestate;

  storeinforow(
    this.id,
    this.username,
    this.email,
    this.StoreName, 
    this.Storestate,
  );
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
     final isDesktop =MediaQuery.of(context).size.width>=1200;
    final ismobile =MediaQuery.of(context).size.width<=600;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        // width: screenWidth,
        height: 70,
        color: Pcolor,
        child: Column(
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                isDesktop?
                Expanded(
                  flex: 4,
                  child: Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 100),
                    child: Text(
                      '$username ',
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ):Container(),
                Expanded(
                  flex: 4,
                  child: Padding(
                     padding: EdgeInsets.only(top: 15.0, right: isDesktop?80:20),
                    child: Text(
                      '$email ',
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                     padding: EdgeInsets.only(top: 15.0, right: 120),
                    child: Text(
                      '$StoreName',
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                     padding: EdgeInsets.only(top: 15.0, right: 140),
                    child: Text(
                      '$StoreName',
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 100.0,left: 50, top: 10, bottom: 8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      child: Text(
                        'حذف المتجر',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Pcolor),
                      ),
                      onPressed: () async {
                        print(id);
                        await databaseHelper.deleteStore(id: id);
                      }),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  // width: screenWidth,
                  height: 70,
                  color: Colors.white),
            )
          ],
        ),
      );
    });
  }
}
