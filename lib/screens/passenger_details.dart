import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/helpers/global.dart';
import 'package:login_example/screens/insurance_details.dart';

import '../helpers/database_connection.dart';
import 'dashboard_screen.dart';

class PassengerDetails extends StatefulWidget {
  static const routeName = '/passenger_details';

  const PassengerDetails({Key? key}) : super(key: key);

  @override
  _PassengerDetailsState createState() => _PassengerDetailsState();
}

class _PassengerDetailsState extends State<PassengerDetails> {
  int passIndex = 1;
  int number = 1;

  String firstName = '';
  List firstNames = [];

  String lastName = '';
  List lastNames = [];

  String birthday = '';
  List birthdays = [];

  String nationality = '';
  List nationalities = [];

  String gender = '';
  List genders = [];

  String passportNumber = '';
  List passportNumbers = [];

  String passportExpire = '';
  List passportExpires = [];

  void print2() {
    Navigator.pushNamed(context, DashboardScreen.routeName);
  }

  void onSubmit() {
    getData("test");
  }

  void onSubmit2() {
    postData(
        "posts", ["id", "post_header", "post_body"], ["6", '"again"', '"now"']);
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as UsernamePass;
    if (!isLoggedIn) {
      return const Center(
          child: Text(
        "Please Log In To Continue",
        style: TextStyle(
            fontSize: 48, fontWeight: FontWeight.bold, color: Colors.red),
      ));
    } else {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(children: <Widget>[
                  MenuBar(),
                  Card(
                    color: Colors.blue.shade100,
                    elevation: 5,
                    margin: const EdgeInsets.only(top: 15),
                    // shape: ContinuousRectangleBorder(
                    //   borderRadius: BorderRadius.circular(100.0),
                    // ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Fill Passenger Details',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  divider,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          // padding: EdgeInsets.all(20),
                          width: 400,

                          child: TextField(
                            onChanged: (text) => number = int.parse(text),
                            decoration: InputDecoration(
                              hintText: "Enter Number of Passengers",
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              numberOfPassengers.value = number;
                            },
                            child: const Text("Update")),
                      )
                    ],
                  ),
                  divider,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        // padding: EdgeInsets.all(20),
                        width: 400,

                        child: TextField(
                          onChanged: (text) => firstName = text,
                          decoration: InputDecoration(
                            hintText: "First Name",
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
                      SizedBox(
                        // padding: EdgeInsets.all(20),
                        width: 400,

                        child: TextField(
                          onChanged: (text) => lastName = text,
                          decoration: InputDecoration(
                            hintText: "Last Name",
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        // padding: EdgeInsets.all(20),
                        width: 400,

                        child: TextField(
                          onChanged: (text) => birthday = text,
                          decoration: InputDecoration(
                            hintText: "Birthdate (DD/MM/YYYY)",
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
                      SizedBox(
                        // padding: EdgeInsets.all(20),
                        width: 400,

                        child: TextField(
                          onChanged: (text) => gender = text,
                          decoration: InputDecoration(
                            hintText: "Gender (M/F/T)",
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        // padding: EdgeInsets.all(20),
                        width: 400,

                        child: TextField(
                          onChanged: (text) => passportNumber = text,
                          decoration: InputDecoration(
                            hintText: "Passport Number",
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
                      SizedBox(
                        // padding: EdgeInsets.all(20),
                        width: 400,
                        child: TextField(
                          onChanged: (text) => passportExpire = text,
                          decoration: InputDecoration(
                            hintText: "Passport Expiry (DD/MM/YYYY)",
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
                  Center(
                    child: SizedBox(
                      width: 400,
                      child: TextField(
                        onChanged: (text) => nationality = text,
                        decoration: InputDecoration(
                          hintText: "Nationality",
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
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: print2,
                    child: ValueListenableBuilder(
                      valueListenable: numberOfPassengers,
                      builder:
                          (BuildContext context, int value, Widget? child) {
                        return GestureDetector(
                          onTap: () {
                            if (passIndex != numberOfPassengers.value) {
                              setState(
                                () {
                                  passIndex++;
                                },
                              );
                            } else {
                              Navigator.pushNamed(
                                  context, InsuranceDetails.routeName);
                            }
                          },
                          child: Text(
                            "Submit Passenger " +
                                passIndex.toString() +
                                " of " +
                                numberOfPassengers.value.toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white60,
      );
    }
  }
}
