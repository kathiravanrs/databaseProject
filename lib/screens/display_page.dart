import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:login_example/helpers/global.dart';

import '../helpers/database_connection.dart';

class DisplayPage extends StatefulWidget {
  static const routeName = '/displayPage';

  DisplayPage({Key? key}) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  var userData;

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
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("View All Tables"),
            leading: const Icon(
              Icons.home,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
              future: getAllData(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  userData = snapshot.data;
                  Widget getTextWidgets(List data) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: data
                            .map((item) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: JsonTable(item),
                                ))
                            .toList(),
                      ),
                    );
                  }

                  print(userData.length);
                  return Container(
                    child: getTextWidgets(userData),
                    // child: JsonTable(userData[0]),
                  );
                }
              },
            ),
          ),
        ),
      );
    }
  }
}
