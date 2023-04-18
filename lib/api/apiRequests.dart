import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  var success;
  var token;

  void printStreamedResponse(http.StreamedResponse response) {
    final buffer = StringBuffer(); // Buffer to accumulate the response body

    response.stream.listen(
      (data) {
        buffer.write(
            utf8.decode(data)); // Convert bytes to string and append to buffer
      },
      onDone: () {
        print(buffer.toString()); // //Print the accumulated response body
      },
      onError: (error) {
        print(
            'Error: $error'); // Handle any errors that occur while reading the stream
      },
      cancelOnError: true, // Cancel the stream on error
    );
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  loginData({required String username, required String password}) async {
    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com//login');
    final response = await http
        .post(myUrl, body: {"username": username, "password": password});
    var data = json.decode(response.body);
    success = data['success'];
    //print('success = $success');
    if (success) {
      _save(data['data']['token']);
      //print(data['data']['token']);
    } else {
      //print(data['message']);
    }
  }

  Future<List> getStores() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;
    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com/getstores');
    print(myUrl);
    var response = await http.get(
      myUrl,
      headers: {'Authorization': 'token $value'},
    );
    var data = json.decode(response.body);
    success = data['success'];
    return data['data'];
  }

  Future<List> getStoreProducts({required int id}) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com/getstoreproducts');
    var response = await http.post(myUrl,
        headers: {'Authorization': 'token $value'}, body: {"Store": "$id"});
    var data = json.decode(response.body);
    success = data['success'];
    // print(data['data']);
    return data['data'];
  }

  Future<List> getStoreOrders({required int id}) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com/getstoreorders');
    var response = await http.post(myUrl,
        headers: {'Authorization': 'token $value'}, body: {"Store": "$id"});
    var data = json.decode(response.body);
    success = data['success'];
    print(data['data']);

    return data['data'];
  }

  Future<List> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com/getusers');
    var response =
        await http.get(myUrl, headers: {'Authorization': 'token $value'});
    var data = json.decode(response.body);
    success = data['success'];
    return data['data'];
  }

  addStore(
      {required int id, required String storename, required var image}) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://vzzoz.pythonanywhere.com/addstore"),
    );

    request.headers["Authorization"] = "token $value";
    request.fields["ID"] = id.toString();
    request.fields["Name"] = storename;
    request.files.add(image);
    var response = await request.send();
    printStreamedResponse(response);
  }

  deleteStore({required int id}) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri.parse('http://vzzoz.pythonanywhere.com/deletestore');
    var response = await http.post(myUrl,
        headers: {'Authorization': 'token $value'},
        body: {"Store": id.toString()});
    var data = json.decode(response.body);
    success = data['success'];
    print(data);
    return data;
  }
}
