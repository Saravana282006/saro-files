import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'employees_list.dart';

class FetchUser {
  var data = [];
  List<Employees> results = [];
  String fetchurl = "https://jsonplaceholder.typicode.com/users";
  
  Future<List<Employees>> getEmployees({String? query}) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Employees.fromJson(e)).toList();
        if (query !=null){
          results = results.where((element) => element.name!.toLowerCase().contains(query.toLowerCase())).toList();
        }
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('No results found');
    }
    return results;
  }
}
