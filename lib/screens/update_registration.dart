// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/helpers/global.dart';
import 'package:login_example/screens/profile_screen.dart';

import '../helpers/database_connection.dart';

class UpdateRegistrationScreen extends StatefulWidget {
  static const routeName = '/update';

  const UpdateRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<UpdateRegistrationScreen> createState() =>
      _UpdateRegistrationScreenState();
}

class _UpdateRegistrationScreenState extends State<UpdateRegistrationScreen> {
  String username = '';
  String firstName = '';
  String lastName = '';
  String doorNumber = '';
  String streetAddress = '';
  String city = '';
  String zipCode = '';
  String country = '';
  String gender = '';
  String customerType = '';
  String phoneNumber = '';
  String countryCode = '';
  String contNum = '';
  String email = '';
  String pass = '';

  void onSubmit() {
    getData("Select * from userpass");
  }

  void onSubmit2() {
    updateData("users", [
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
    ]);
    Navigator.pushNamed(context, ProfileScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    email = userEmail;
    return FutureBuilder(
      future:
          getData("Select * from users where email= '" + "vc@gmail.com" + "'"),
      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          var userData = snapshot.data[0];
          firstName = userData['first_name'];
          lastName = userData['last_name'];
          countryCode = userData['country_code'];
          phoneNumber = userData['phone_numer'];
          doorNumber = userData['door_numer'];
          streetAddress = userData['street_address'];
          city = userData['city'];
          country = userData['country'];
          zipCode = userData['zip_code'];
          customerType = userData['customer_type'];
          gender = userData['gender'];
          contNum = userData['emergency_contact'];
          print(userData);
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
                          child: const Text(
                            'Update Your Profile Details',
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
                                  hintText: firstName,
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
                                  hintText: lastName,
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
                                  hintText: countryCode,
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
                                  hintText: phoneNumber,
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
                                  hintText: doorNumber,
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
                                  hintText: streetAddress,
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
                                  hintText: city,
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
                                  hintText: zipCode,
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
                                  hintText: country,
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
                                  hintText:
                                      "Emergency Contact Number " + contNum,
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
                                    items: <String>[
                                      'Direct',
                                      'Agent',
                                      'Membership'
                                    ].map((String values) {
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
      },
    );
  }
}
