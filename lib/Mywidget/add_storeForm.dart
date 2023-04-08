import 'package:flutter/material.dart';
import 'package:zit_admin_screens/constant.dart';

import '../MyFunctions/myFunction.dart';


addDialog({required context}) {
  
  final formKey = GlobalKey<FormState>();
  final categoryNameController = TextEditingController();
  MyFunctions myFunctions = MyFunctions();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Pcolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: [
          Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Pcolor, Pcolor]),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(12, 26),
                      blurRadius: 50,
                      spreadRadius: 0,
                      color: wallpaper),
                ]),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:wallpaper,
                  radius: 25,
                  child: Icon(Icons.add_business_outlined,
                  color: Colors.black87,),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text("اضافة متجر جديد",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 3.5,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextFormField(
                          textAlign: TextAlign.center,
                          controller: categoryNameController,
                          decoration: InputDecoration(
                              hintText: "اسم المتجر",
                              hintStyle: TextStyle(color: Colors.black87)),
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          controller: categoryNameController,
                          decoration: InputDecoration(
                              hintText: "اسم المالك",
                              hintStyle: TextStyle(color: Colors.black87)),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              alignment: Alignment.center,
                              side: MaterialStateProperty.all(
                                  BorderSide(width: 1, color: Colors.black87)),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.only(
                                      right: 35,
                                      left: 35,
                                      top: 12.5,
                                      bottom: 12.5)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ))),
                          onPressed: () {
                            myFunctions.getFromGallery();
                          },
                          child: Text(
                            'اضف صوره',
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              alignment: Alignment.center,
                              side: MaterialStateProperty.all(
                                  BorderSide(width: 1, color: Colors.black87)),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.only(
                                      right: 75,
                                      left: 75,
                                      top: 12.5,
                                      bottom: 12.5)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ))),
                          onPressed: () {},
                          child: Text(
                            'اضافه',
                             style: const TextStyle(
                                color: Colors.black87, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}