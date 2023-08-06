import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:zit_admin_screens/Mywidget/store_Card.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';
import 'package:zit_admin_screens/constant.dart';
import 'package:http/http.dart' as http;
import '../Mywidget/add_storeForm.dart';

class store extends StatefulWidget {
  const store({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return storeState();
  }
}

class storeState extends State<store> {
  String searchQuery = '';
  List<dynamic> stores = [];
  List<dynamic> filteredStores = [];
  DatabaseHelper databaseHelper = DatabaseHelper();
  StreamController<List<dynamic>> _storeStreamController = StreamController();
 
  

  @override
  void initState() {
     fetchData();
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


  void fetchData() async {
    List<dynamic> fetchedStores = await databaseHelper.getStores();
    setState(() {
      stores = fetchedStores;
      filteredStores = fetchedStores;
    });
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
          return Center(child: CircularProgressIndicator(
            color: Pcolor,
          ));
        } else {
          List<dynamic> storesData = snapshot.data ?? [];
          print(storesData);
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
                  )))),
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
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                              filterStores();
                            });
                          },
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
                            prefixIcon: IconButton(icon:Icon(Icons.search, color: Pcolor),
                            onPressed: () {},),
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
                      flex: 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: storesData.length,
                        itemBuilder: (context, index) {
                          // Use Storecard widget here
                          return Row(
                            children: [
                              Storecard(
                                'http://vzzoz.pythonanywhere.com${storesData[index]['Image']}',
                                storesData[index]['Name'],
                                storesData[index]['Owner'],
                                id: storesData[index]['id'],
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          );
        }});
        }

         void filterStores() {
    if (searchQuery.isEmpty) {
      setState(() {
        filteredStores = stores;
      });
    } else {
      setState(() {
        filteredStores = stores.where((store) {
          final storeName = store['Name'].toString().toLowerCase();
          final query = searchQuery.toLowerCase();
          return storeName.contains(query);
        }).toList();
      });
    }
  }
}

      