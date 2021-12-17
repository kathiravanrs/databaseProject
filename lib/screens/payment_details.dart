import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/helpers/global.dart';
import 'package:login_example/screens/invoice_page.dart';

import '../helpers/database_connection.dart';

class PaymentDetails extends StatefulWidget {
  static const routeName = '/payment_details';

  const PaymentDetails({Key? key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String cardNum = '';
  String nameOnCard = '';
  String expiryMonth = '';
  String cvv = '';

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
                        'Enter Your Payment Details',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    divider,
                    Container(
                      // padding: EdgeInsets.all(20),
                      width: 600,

                      child: TextField(
                        onChanged: (text) => cardNum = text,
                        decoration: InputDecoration(
                          hintText: "Enter your card number",
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
                        onChanged: (text) => nameOnCard = text,
                        decoration: InputDecoration(
                          hintText: "Name on the card",
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
                        onChanged: (text) => expiryMonth = text,
                        decoration: InputDecoration(
                          hintText: "Expiry month and Year (MM/YY)",
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
                        onChanged: (text) => cvv = text,
                        decoration: InputDecoration(
                          hintText: "CVV",
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
                        onPressed: () {
                          if (cvv.isEmpty ||
                              nameOnCard.isEmpty ||
                              cardNum.isEmpty ||
                              expiryMonth.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Fill all the details before submitting"),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            Navigator.pushNamed(context, InvoicePage.routeName);
                          }
                        },
                        child: const Text("Submit")),
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
}
