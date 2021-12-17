// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/helpers/global.dart';
import 'package:login_example/screens/passenger_details.dart';
import 'package:login_example/widgets/flight_card.dart';

import '../helpers/database_connection.dart';

class FlightDetails extends StatefulWidget {
  static const routeName = '/flight_details';

  FlightDetails({Key? key}) : super(key: key);

  @override
  State<FlightDetails> createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  var userData;
  var flightId;

  void pushPassengerScreen() {
    Navigator.pushNamed(context, PassengerDetails.routeName);
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
    if (!isLoggedIn) {
      return Center(
          child: Center(
        child: GestureDetector(
          onTap: pushPassengerScreen,
          child: const Card(
            child: Text(
              "Please Log In To Continue",
              style: TextStyle(
                  fontSize: 48, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
        ),
      ));
    } else {
      return Scaffold(
        body: FutureBuilder(
          future: getData("Select * from sk_ks_flight"),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              userData = snapshot.data;
              Widget getTextWidgets(List data) {
                // print(data.toString());
                return GridView.count(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 10,
                  ),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio:
                      (MediaQuery.of(context).size.height * 0.0006 * 2.05),
                  children: data
                      .map((item) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 40,
                              child: FlightCard(
                                airlines: item['air_name'],
                                dept: item['f_depapt'],
                                arrival: item['f_ariapt'],
                                arrCity: item['f_ariapt'],
                                depCity: item['f_depapt'],
                                arrTime: item['f_aritime'],
                                depTime: item['f_deptime'],
                              ),
                            ),
                          ))
                      .toList(),
                );
              }

              print(userData[0]);
              return Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          MenuBar(),
                          Card(
                            color: Colors.blue.shade100,
                            elevation: 5,
                            margin: const EdgeInsets.only(top: 15),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Choose your flight',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          divider,
                          ValueListenableBuilder(
                            valueListenable: arrival,
                            builder: (BuildContext context, String value,
                                Widget? child) {
                              return ValueListenableBuilder(
                                  valueListenable: departure,
                                  builder: (context, value, child) {
                                    if (departure.value != "dept") {
                                      return Center(
                                        child: Card(
                                          color: Colors.blue.shade100,
                                          elevation: 5,
                                          margin:
                                              const EdgeInsets.only(top: 15),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Currently chosen flight is from ' +
                                                  departure.value +
                                                  " To " +
                                                  arrival.value,
                                              style: const TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  });
                            },
                          ),
                          divider,
                          getTextWidgets(userData),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: pushPassengerScreen,
                              child: const Text(
                                "Submit",
                                style: TextStyle(fontSize: 36),
                              )),
                          divider,
                          divider,
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
        backgroundColor: Colors.white60,
      );
    }
  }
}
