import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

List<String> allQueries = [
  "SELECT * from users",
  "SELECT * from userpass",
  "SELECT * from sk_ks_passenger",
  "SELECT * from sk_ks_customer",
  "SELECT * from sk_ks_agdetails",
  "SELECT * from sk_ks_membership",
  "SELECT * from sk_ks_iplan",
  "SELECT * from sk_ks_pass_ins",
  "SELECT * from sk_ks_invoice",
  "SELECT * from sk_ks_payment",
  "SELECT * from sk_ks_aircraftmodel",
  "SELECT * from sk_ks_airline",
  "SELECT * from sk_ks_airmod",
  "SELECT * from sk_ks_flight",
  "SELECT * from sk_ks_airport",
  "SELECT * from sk_ks_airp_fl",
  "SELECT * from sk_ks_flight_psng",
  "SELECT * from sk_ks_specialassist",
  "SELECT * from sk_ks_mealplan",
  "SELECT * from sk_ks_cabclass"
];

Future getAllData() async {
  List result = [];
  for (String v in allQueries) {
    var url =
        Uri.parse('https://databaseprojectfall21.000webhostapp.com/get.php');
    http.Response response = await http.post(url, body: v);
    result.add(jsonDecode(response.body.toString()));
  }
  //
  // print(response.body.toString());
  // var data = jsonDecode(response.body);
  // print(data.toString());
  print(result);
  return result;
}

Future getData(String query) async {
  var url =
      Uri.parse('https://databaseprojectfall21.000webhostapp.com/get.php');
  http.Response response = await http.post(url, body: query);
  // print(response.body.toString());
  var data = jsonDecode(response.body);
  // print(data.toString());
  return data;
}

Future postData(String table, List<String> column, List<String> values) async {
  String query = "Insert into " +
      table +
      "(" +
      column.join(", ") +
      ") Values (" +
      values.join(", ") +
      ")";
  print(query);
  var url =
      Uri.parse('https://databaseprojectfall21.000webhostapp.com/post.php');
  http.Response response = await http.post(url, body: query);
  print('posted');
  print(response.body.toString());
}

String encode(String val) {
  return (sha256.convert(utf8.encode(val)).toString());
}
