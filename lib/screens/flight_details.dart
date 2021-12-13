// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/screens/dashboard_screen.dart';
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

  String mealPlanID = '';
  String cabinClassID = 'firstName';
  String specialRequestID = 'lastName';

  void print2() {
    print(mealPlanID + " " + cabinClassID + " " + specialRequestID);
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

    // return Scaffold(
    //   body: FutureBuilder(
    //     future: getData("Select * from sk_ks_flight"),
    //     builder: (BuildContext ctx, AsyncSnapshot snapshot) {
    //       if (snapshot.data == null) {
    //         return Container(
    //           child: const Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       } else {
    //         userData = snapshot.data;
    //         print(userData);
    //         return Stack(
    //           children: <Widget>[
    //             SingleChildScrollView(
    //               child: Container(
    //                 margin: const EdgeInsets.symmetric(horizontal: 32),
    //                 child: Column(
    //                   children: <Widget>[
    //                     MenuBar(),
    //                     Card(
    //                       color: Colors.blue.shade100,
    //                       elevation: 5,
    //                       margin: const EdgeInsets.only(top: 15),
    //                       child: const Text(
    //                         'Choose your flight',
    //                         style: TextStyle(fontSize: 32),
    //                       ),
    //                     ),
    //                     divider,
    //                     Container(
    //                       width: 600,
    //                       child: TextField(
    //                         onChanged: (text) => mealPlanID = text,
    //                         decoration: InputDecoration(
    //                           hintText: "Choose Meal Plan",
    //                           filled: true,
    //                           fillColor: Colors.purple.withOpacity(.1),
    //                           contentPadding: const EdgeInsets.all(15),
    //                           errorStyle: const TextStyle(
    //                             backgroundColor: Colors.orange,
    //                             color: Colors.white,
    //                           ),
    //                           labelStyle: const TextStyle(fontSize: 12),
    //                         ),
    //                       ),
    //                     ),
    //                     divider,
    //                     Container(
    //                       width: 600,
    //                       child: TextField(
    //                         onChanged: (text) => cabinClassID = text,
    //                         decoration: InputDecoration(
    //                           hintText: "Enter cabin class",
    //                           filled: true,
    //                           fillColor: Colors.purple.withOpacity(.1),
    //                           contentPadding: const EdgeInsets.all(15),
    //                           errorStyle: const TextStyle(
    //                             backgroundColor: Colors.orange,
    //                             color: Colors.white,
    //                           ),
    //                           labelStyle: const TextStyle(fontSize: 12),
    //                         ),
    //                       ),
    //                     ),
    //                     divider,
    //                     Container(
    //                       width: 600,
    //                       child: TextField(
    //                         onChanged: (text) => specialRequestID = text,
    //                         decoration: InputDecoration(
    //                           hintText: "Enter Special Request",
    //                           filled: true,
    //                           fillColor: Colors.purple.withOpacity(.1),
    //                           contentPadding: const EdgeInsets.all(15),
    //                           errorStyle: const TextStyle(
    //                             backgroundColor: Colors.orange,
    //                             color: Colors.white,
    //                           ),
    //                           labelStyle: const TextStyle(fontSize: 12),
    //                         ),
    //                       ),
    //                     ),
    //                     divider,
    //                     const SizedBox(height: 20),
    //                     ElevatedButton(
    //                         onPressed: print2, child: const Text("Submit")),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         );
    //       }
    //     },
    //   ),
    //   backgroundColor: Colors.white60,
    // );
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
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.start,
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
                        getTextWidgets(userData),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: print2, child: const Text("Submit")),
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
