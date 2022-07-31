import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/model.dart';

getUsers() async {
  List userlist = [];
  String url = "https://jsonplaceholder.typicode.com/users";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  
  

  for (var i in data) {
    userlist.add(UserModel.fromJson(i));
  }
  return userlist;
}
