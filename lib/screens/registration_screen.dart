// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/components/color.dart';
import 'package:login_example/screens/login_screen.dart';

import '../helpers/database_connection.dart';
import '../helpers/userpass.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/signup';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String username = '';
  String firstName = '';
  String lastName = '';
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
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        countryCode.isEmpty ||
        country.isEmpty ||
        phoneNumber.isEmpty ||
        streetAddress.isEmpty ||
        zipCode.isEmpty ||
        gender.isEmpty ||
        doorNumber.isEmpty ||
        contNum.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter All Fields"),
        backgroundColor: Colors.red,
      ));
    } else {
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
        "'" + encode(pass) + "'",
      ]);
      Navigator.pushNamed(context, LoginScreen.routeName);
    }
  }

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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Safe Fly Management Excellence",
                          style: GoogleFonts.montserrat(
                              color: textPrimary,
                              fontSize: 30,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.blue.shade100,
                    elevation: 5,
                    margin: const EdgeInsets.only(top: 15),
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
