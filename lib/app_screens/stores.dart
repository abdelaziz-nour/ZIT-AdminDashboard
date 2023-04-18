import 'package:flutter/material.dart';
import 'package:zit_admin_screens/Mywidget/store_Card.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';
import 'package:zit_admin_screens/constant.dart';

import '../Mywidget/add_storeForm.dart';

class store extends StatefulWidget {
  const store({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return storeState();
  }
}

class storeState extends State<store> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    databaseHelper.getStores();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Pcolor,
          title: const Center(
            child: Text(
              'المتاجر',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 1.5,
                  top: screenHeight / 25,
                  right: screenWidth / 15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Pcolor),
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: const Icon(Icons.search, color: Pcolor),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth / 15, top: 10),
              child: TextButton(
                  child: const Text(
                    "اضافة متجر جديد",
                    style: TextStyle(
                        color: Pcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    addDialog(context: context);
                  }),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: databaseHelper.getStores().asStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Storecard(
                      'http://vzzoz.pythonanywhere.com${snapshot.data![index]['Image']}',
                      snapshot.data![index]['Name'],
                      snapshot.data![index]['Owner'],
                      id: snapshot.data![index]['id'],
                    );
                  },
                );
              },
            ),
          ),
        ]);
      }),
    );
  }
}
