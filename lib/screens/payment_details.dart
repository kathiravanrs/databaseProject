import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';

import '../helpers/database_connection.dart';
import 'dashboard_screen.dart';

class PaymentDetails extends StatefulWidget {
  static const routeName = '/payment_details';

  const PaymentDetails({Key? key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
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
                      'Payment Details',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  divider,
                  Container(
                    // padding: EdgeInsets.all(20),
                    width: 600,

                    child: TextField(
                      onChanged: (text) => mealPlanID = text,
                      decoration: InputDecoration(
                        hintText: "Choose Meal Plan",
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
                  divider,
                  Container(
                    width: 600,
                    // margin: EdgeInsets.all(20),
                    child: TextField(
                      onChanged: (text) => cabinClassID = text,
                      decoration: InputDecoration(
                        hintText: "Enter cabin class",
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
                  divider,
                  Container(
                    // padding: EdgeInsets.all(20),
                    width: 600,
                    child: TextField(
                      onChanged: (text) => specialRequestID = text,
                      decoration: InputDecoration(
                        hintText: "Enter Special Request",
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
                  divider,
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
