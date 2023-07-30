import 'dart:async';

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
  StreamController<List<dynamic>> _storeStreamController = StreamController();
  List<dynamic> _storesData = [];

  @override
  void initState() {
    super.initState();
    // Fetch the stores data and update the StreamController
    getStoresData().then((data) {
      _storeStreamController.add(data);
    });
  }

  @override
  void dispose() {
    _storeStreamController.close();
    super.dispose();
  }

  Future<List<dynamic>> getStoresData() async {
    return await databaseHelper.getStores();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Use StreamBuilder to listen to the stream and update the UI.
    return StreamBuilder<List<dynamic>>(
      stream: _storeStreamController.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          List<dynamic> storesData = snapshot.data ?? [];
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
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth / 1.5,
                          top: screenHeight / 25,
                          right: screenWidth / 15,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Pcolor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: const Icon(Icons.search, color: Pcolor),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: screenWidth / 15, top: 10),
                        child: TextButton(
                          child: const Text(
                            "اضافة متجر جديد",
                            style: TextStyle(
                              color: Pcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () async {
                            List<dynamic> usersData =
                                await databaseHelper.getUsers();
                            addDialog(context: context, usersData: usersData);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: storesData.length,
                        itemBuilder: (context, index) {
                          // Use Storecard widget here
                          return Storecard(
                            'http://vzzoz.pythonanywhere.com${storesData[index]['Image']}',
                            storesData[index]['Name'],
                            storesData[index]['Owner'],
                            id: storesData[index]['id'],
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
