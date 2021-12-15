import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';

import '../helpers/database_connection.dart';
import 'dashboard_screen.dart';

class PassengerDetails extends StatefulWidget {
  static const routeName = '/passenger_details';

  const PassengerDetails({Key? key}) : super(key: key);

  @override
  _PassengerDetailsState createState() => _PassengerDetailsState();
}

class _PassengerDetailsState extends State<PassengerDetails> {
  int numberOfPassengers = 1;
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
                            onChanged: (text) =>
                                numberOfPassengers = int.parse(text),
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
                              setState(() {
                                numberOfPassengers;
                              });
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
                            hintText: "Birthdate",
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
                            hintText: "Gender",
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
                          onChanged: (text) => numberOfPassengers = text as int,
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
                            hintText: "Passport Expiry",
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
                    child: Container(
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
                      onPressed: print2, child: const Text("Submit")),
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
