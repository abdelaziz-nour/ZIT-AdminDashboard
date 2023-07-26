import 'package:flutter/material.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';
import 'package:zit_admin_screens/constant.dart';

import '../MyFunctions/myFunction.dart';

addDialog({required context, required List usersData}) {
  DatabaseHelper databaseHelper = DatabaseHelper();
  final formKey = GlobalKey<FormState>();
  final storeNameController = TextEditingController();
  var selectedUserId;
  MyFunctions myFunctions = MyFunctions();
  var imageFile;
  var storeOwner;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Pcolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Pcolor, Pcolor]),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: wallpaper,
                  ),
                ]),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: wallpaper,
                  radius: 25,
                  child: Icon(
                    Icons.add_business_outlined,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "اضافة متجر جديد",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 3.5,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: null,
                          onChanged: (value) {
                            selectedUserId = int.parse(value!);
                            storeOwner = usersData.firstWhere(
                                (element) => element['id'] == selectedUserId);
                          },
                          items: usersData
                              .where((user) => user['Store'] == "None")
                              .map<DropdownMenuItem<String>>((user) {
                            return DropdownMenuItem<String>(
                              value: user['id'].toString(),
                              child: Text(user['UserName']),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            hintText: "اسم المالك",
                            hintStyle: const TextStyle(color: Colors.black87),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          controller: storeNameController,
                          decoration: const InputDecoration(
                            hintText: "اسم المتجر",
                            hintStyle: TextStyle(color: Colors.black87),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'حقل إسم المتجر مطلوب';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            alignment: Alignment.center,
                            side: MaterialStateProperty.all(
                              BorderSide(width: 1, color: Colors.black87),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                right: 35,
                                left: 35,
                                top: 12.5,
                                bottom: 12.5,
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            imageFile = await myFunctions
                                .pickAndConvertToMultipartFile();
                          },
                          child: const Text(
                            'اضف صوره',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            alignment: Alignment.center,
                            side: MaterialStateProperty.all(
                              BorderSide(width: 1, color: Colors.black87),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                right: 75,
                                left: 75,
                                top: 12.5,
                                bottom: 12.5,
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            try {
                              if (formKey.currentState!.validate()) {
                                print(storeOwner);
                                print(storeOwner[0]);
                                await databaseHelper.addStore(
                                  email: storeOwner['Email'],
                                  image: imageFile,
                                  storename: storeNameController.text,
                                );

                                Navigator.pop(context);
                              }
                            } catch (e) {
                              print(e);
                              return myFunctions.noImageField(context);
                            }
                          },
                          child: const Text(
                            'اضافه',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
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
