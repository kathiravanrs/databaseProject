import 'package:flutter/material.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/screens/update_registration.dart';

import '../helpers/database_connection.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void print2() {
    // Navigator.pushNamed(context, DashboardScreen.routeName);
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Profile',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  divider,
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UpdateRegistrationScreen.routeName);
                          },
                          child: const Text(
                            "View/Update your Profile",
                            style: TextStyle(fontSize: 32),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {},
                          child: const Text(
                            "Delete Your Account",
                            style: TextStyle(fontSize: 32),
                          ))
                    ],
                  ),
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
