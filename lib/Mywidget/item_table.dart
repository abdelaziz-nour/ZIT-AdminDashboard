
import 'package:flutter/material.dart';

class orderitemWidget extends StatelessWidget{
  final String productname;
  final String price;
  final String Quantity;

  const orderitemWidget ({super.key, required this.productname, required this.price, required this.Quantity});


    @override
  Widget build(BuildContext context) {
   return  Scaffold(
    backgroundColor: Colors.white,
     body: Center(
       child: Column(
         children: [
          DataTable(
            columns: [
            DataColumn(
                              label: Text(
                                'اسم المنتج',
                                
                                style: TextStyle(
                                  
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 11, 35, 55),
                                ),
                              ),
       ), 
           DataColumn(
                              label: Text(
                                'السعر',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 11, 35, 55),
                                ),
                              ),
                              
       ),
           DataColumn(
                              label: Text(
                                'الكميه',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 11, 35, 55),
                                ),
                              ),
              ),
            
              ],
            rows: [
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  "  $productname",
                                ),
                              ),
                              DataCell(
                                Text(
                                  "$price",
                                ),
                              ),
                               DataCell(
                                Text(
                                  "$Quantity",
                                ),
                              ),
                            ],
                          ),
            
   ]
   ) ]),
     ),
   ); }}