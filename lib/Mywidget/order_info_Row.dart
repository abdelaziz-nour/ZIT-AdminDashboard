import 'dart:html';
import 'package:flutter/material.dart';
import '../app_screens/order_item.dart';
import '../constant.dart';

class orderinforow extends StatelessWidget {
  final String ordernum;
  final String storename;
  final String Buyer;
  final String orderdate;
  final String orderamount;
  final List OrderItems;

  const orderinforow(
    this.ordernum,
    this.storename,
    this.Buyer,
    this.orderdate,
    this.orderamount,
    this.OrderItems,
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final isDesktop = MediaQuery.of(context).size.width >= 600;
    final ismobile = MediaQuery.of(context).size.width <= 600;

    double calculateTotalAmount(List orderItems) {
      double total = 0;
      for (var item in orderItems) {
        total += item['Subtotal'];
      }
      return total;
    }

    return Container(
      // width: screenWidth,

      height: 70,
      color: Pcolor,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return orderitemscreen(OrderItems);
              }));
            },
            child: Row(
              children: [
                isDesktop
                    ? Expanded(
                        flex: 5,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 12.0, right: 50, bottom: 10),
                          child: Text(
                            '$ordernum ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Container(),
                isDesktop
                    ? Expanded(
                        flex: 5,
                        child: Text(
                          '$storename ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                Expanded(
                  flex: 5,
                  child: Text(
                    '$Buyer',

                    // ignore: prefer_const_constructors

                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    '$orderdate',

                    // ignore: prefer_const_constructors

                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.0, right: 45, bottom: 10),
                    child: Text(
                      '${calculateTotalAmount(OrderItems)}', // Calculate and display the total amount
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(

                // width: screenWidth,
                height: 70,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
