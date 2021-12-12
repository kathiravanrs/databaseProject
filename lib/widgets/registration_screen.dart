// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/login_screen.dart';

import '../database_connection.dart';
import '../userpass.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/signup';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String username = '';
  String firstName = 'firstName';
  String lastName = 'lastName';
  String doorNumber = '';
  String streetAddress = '';
  String city = '';
  String zipCode = '';
  String country = '';
  String gender = 'Male';
  String customerType = 'Direct';
  String phoneNumber = '';
  String countryCode = '';
  String contNum = '';
  String email = '';
  String pass = '';

  void onSubmit() {
    getData("Select * from userpass");
  }

  void onSubmit2() {
    postData("users", [
      'first_name',
      'last_name',
      'country_code',
      'phone_numer',
      'door_numer',
      'street_address',
      'city',
      'country',
      'zip_code',
      'emergency_contact',
      'gender',
      'customer_type',
      'email',
      'pass'
    ], [
      "'" + firstName + "'",
      "'" + lastName + "'",
      "'" + countryCode + "'",
      "'" + phoneNumber + "'",
      "'" + doorNumber + "'",
      "'" + streetAddress + "'",
      "'" + city + "'",
      "'" + country + "'",
      "'" + zipCode + "'",
      "'" + contNum + "'",
      "'" + gender + "'",
      "'" + customerType + "'",
      "'" + email + "'",
      "'" + pass + "'",
    ]);
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  // Future getData() async {
  //   var url =
  //       Uri.parse('https://databaseprojectfall21.000webhostapp.com/get.php');
  //   http.Response response = await http.get(url);
  //   // print(response.body.toString());
  //   var data = jsonDecode(response.body);
  //   print(data.toString());
  // }

  // Future postData(
  //     String table, List<String> column, List<String> values) async {
  //   String query = "Insert into " +
  //       table +
  //       "(" +
  //       column.join(", ") +
  //       ") Values (" +
  //       values.join(", ") +
  //       ")";
  //   // for (var element in column) {
  //   //   query + element;
  //   // }
  //   // query += ") Values (";
  //   // for (var element in values) {
  //   //   query + element;
  //   // }
  //   // query += ")";
  //   print(query);
  //   var url =
  //       Uri.parse('https://databaseprojectfall21.000webhostapp.com/post.php');
  //   http.Response response = await http.post(url, body: query);
  //   print('posted');
  //   // print(response.body.toString());
  //   print(response.body.toString());
  //   // var data = jsonDecode(response.body);
  //   // print(data.toString());
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UsernamePass;
    email = args.username!;
    pass = args.password!;
    print(args.toString());
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: <Widget>[
                  MenuBar(),
                  Card(
                    color: Colors.blue.shade100,
                    elevation: 5,
                    margin: const EdgeInsets.only(top: 15),
                    // shape: ContinuousRectangleBorder(
                    //   borderRadius: BorderRadius.circular(100.0),
                    // ),
                    child: const Text(
                      'Fill out the new user registration form',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  divider,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(20),
                        width: 600,
                        child: TextField(
                          onChanged: (text) => firstName = text,
                          decoration: InputDecoration(
                            hintText: "Enter First Name",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        width: 600,
                        // margin: EdgeInsets.all(20),
                        child: TextField(
                          onChanged: (text) => lastName = text,
                          decoration: InputDecoration(
                            hintText: "Enter Last Name",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  divider,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(20),
                        width: 600,
                        child: TextField(
                          onChanged: (text) => countryCode = text,
                          decoration: InputDecoration(
                            hintText: "Phone Number Country Code",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        width: 600,
                        // margin: EdgeInsets.all(20),
                        child: TextField(
                          onChanged: (text) => phoneNumber = text,
                          decoration: InputDecoration(
                            hintText: "Enter Phone Number",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(20),
                        width: 600,
                        child: TextField(
                          onChanged: (text) => doorNumber = text,
                          decoration: InputDecoration(
                            hintText: "Enter Door Number",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        width: 600,
                        // margin: EdgeInsets.all(20),
                        child: TextField(
                          onChanged: (text) => streetAddress = text,
                          decoration: InputDecoration(
                            hintText: "Enter Street Address",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  divider,
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(20),
                        width: 600,
                        child: TextField(
                          onChanged: (text) => city = text,
                          decoration: InputDecoration(
                            hintText: "Enter City",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        width: 600,
                        // margin: EdgeInsets.all(20),
                        child: TextField(
                          onChanged: (text) => zipCode = text,
                          decoration: InputDecoration(
                            hintText: "ZIP Code",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  divider,
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(20),
                        width: 600,

                        child: TextField(
                          onChanged: (text) => country = text,
                          decoration: InputDecoration(
                            hintText: "Country",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        width: 600,
                        // margin: EdgeInsets.all(20),
                        child: TextField(
                          onChanged: (text) => contNum = text,
                          decoration: InputDecoration(
                            hintText: "Emergency Contact Number",
                            filled: true,
                            fillColor: Colors.purple.withOpacity(.1),
                            contentPadding: const EdgeInsets.all(15),
                            errorStyle: const TextStyle(
                              backgroundColor: Colors.orange,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  divider,
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 600,
                        child: Row(
                          children: [
                            const Text("Gender:"),
                            const SizedBox(width: 30),
                            DropdownButton<String>(
                              hint: Text(gender),
                              // hint: Text("Gender"),
                              items: <String>['Male', 'Female', 'Other']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {
                                print(_);
                                setState(() {
                                  gender = _!;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 600,
                        child: Row(
                          children: [
                            const Text("Customer Type"),
                            const SizedBox(width: 30),
                            DropdownButton<String>(
                              hint: Text(customerType),
                              // hint: Text("Gender"),
                              items: <String>['Direct', 'Agent', 'Membership']
                                  .map((String values) {
                                return DropdownMenuItem<String>(
                                  value: values,
                                  child: Text(values),
                                );
                              }).toList(),
                              onChanged: (_) {
                                print(_);
                                setState(() {
                                  customerType = _!;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  divider,
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: onSubmit2,
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  ),
                  // divider,
                  // const ElevatedButton(onPressed: null, child: Text("Put"))
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white60,
    );
  }
}
