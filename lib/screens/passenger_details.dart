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
  List firstName = [];
  List lastName = [];
  List birthday = [];
  List nationality = [];
  List gender = [];
  List passportNum = [];
  List passportExp = [];

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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
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
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              numberOfPassengers;
                            });
                          },
                          child: const Text("Update"))
                    ],
                  ),
                  divider,
                  Text(numberOfPassengers.toString()),
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // padding: EdgeInsets.all(20),
                          width: 400,

                          child: TextField(
                            onChanged: (text) =>
                                numberOfPassengers = text as int,
                            decoration: InputDecoration(
                              hintText: "Number of Passengers",
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
                            onChanged: (text) =>
                                numberOfPassengers = text as int,
                            decoration: InputDecoration(
                              hintText: "Enter of Passengers",
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
                  ]),
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
