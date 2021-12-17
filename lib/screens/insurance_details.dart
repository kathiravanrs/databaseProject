import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/helpers/global.dart';
import 'package:login_example/screens/payment_details.dart';
import 'package:login_example/widgets/insurance_card.dart';

import '../helpers/database_connection.dart';
import 'dashboard_screen.dart';

class InsuranceDetails extends StatefulWidget {
  static const routeName = '/insurance_details';

  const InsuranceDetails({Key? key}) : super(key: key);

  @override
  _InsuranceDetailsState createState() => _InsuranceDetailsState();
}

class _InsuranceDetailsState extends State<InsuranceDetails> {
  var userData;
  String mealPlanID = '';
  String cabinClassID = 'firstName';
  String specialRequestID = 'lastName';

  void print2() {
    if (kDebugMode) {
      print(mealPlanID + " " + cabinClassID + " " + specialRequestID);
    }
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
    if (!isLoggedIn) {
      return const Center(
          child: Text(
        "Please Log In To Continue",
        style: TextStyle(
            fontSize: 48, fontWeight: FontWeight.bold, color: Colors.red),
      ));
    } else {
      return Scaffold(
        body: FutureBuilder(
          future: getData("Select * from sk_ks_iplan"),
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
                              child: InsuranceCard(
                                  name: item['ip_name'],
                                  cost: item['ip_cost'],
                                  desc: item['ip_des']),
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
                                'Choose your Insurance Plan',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          ValueListenableBuilder(
                              valueListenable: chosenInsuranceCount,
                              builder: (context, value, child) {
                                return Center(
                                  child: Card(
                                    color: Colors.blue.shade100,
                                    elevation: 5,
                                    margin: const EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Required Insurance plans ' +
                                            numberOfPassengers.value
                                                .toString() +
                                            ".  Selected Insurance Plans " +
                                            chosenInsuranceCount.value
                                                .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          divider,
                          getTextWidgets(userData),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {
                                if (chosenInsuranceCount.value ==
                                    numberOfPassengers.value) {
                                  Navigator.pushNamed(
                                      context, PaymentDetails.routeName);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Select the required number of plans"),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              },
                              child: const Text("Submit")),
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
