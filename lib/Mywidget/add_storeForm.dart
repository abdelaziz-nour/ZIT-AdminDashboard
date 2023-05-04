import 'package:flutter/material.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';
import 'package:zit_admin_screens/constant.dart';

import '../MyFunctions/myFunction.dart';

addDialog({required context}) {
  DatabaseHelper databaseHelper = DatabaseHelper();
  final formKey = GlobalKey<FormState>();
  final storeNameController = TextEditingController();
  var selectedUserId;
  MyFunctions myFunctions = MyFunctions();
  var imageFile;

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
                      color: wallpaper),
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
                        FutureBuilder(
                          future: databaseHelper.getUsers(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else {
                              // handle success state
                              List users = snapshot.data ?? [];
                              final filteredUsers = users
                                  .where((user) => user['Store'] == "")
                                  .toList();

                              return DropdownButtonFormField<String>(
                                value: null, // set the initial value
                                onChanged: (value) {
                                  selectedUserId = int.parse(value!);
                                },
                                items: filteredUsers
                                    .map<DropdownMenuItem<String>>((user) {
                                  return DropdownMenuItem<String>(
                                    value: user['id'].toString(),
                                    child: Text(user['UserName']),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  hintText: "اسم المالك",
                                  hintStyle:
                                      const TextStyle(color: Colors.black87),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          controller: storeNameController,
                          decoration: const InputDecoration(
                              hintText: "اسم المتجر",
                              hintStyle: TextStyle(color: Colors.black87)),
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
                              side: MaterialStateProperty.all(const BorderSide(
                                  width: 1, color: Colors.black87)),
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
                          onPressed: () async {
                            imageFile = await myFunctions
                                .pickAndConvertToMultipartFile();
                            print('onpressed : $imageFile');
                          },
                          child: const Text(
                            'اضف صوره',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
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
                          onPressed: () async {
                            try {
                              if (formKey.currentState!.validate()) {
                                await databaseHelper.addStore(
                                    id: selectedUserId,
                                    image: imageFile,
                                    storename: storeNameController.text);

                                Navigator.pop(context);
                              }
                            } catch (e) {
                              return myFunctions.noImageField(context);
                            }
                          },
                          child: const Text(
                            'اضافه',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
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
