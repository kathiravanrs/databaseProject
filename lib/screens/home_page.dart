import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/components.dart';
import 'login_screen.dart';

const String listItemTitleText = "A BETTER COMPANY FOR INSURANCE";
const String listItemPreviewText =
    "Use our website to buy insurance plans to secure your travel";

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Safe Fly Management Excellence",
                              style: GoogleFonts.montserrat(
                                  color: textPrimary,
                                  fontSize: 30,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.w500),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Wrap(
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, LoginScreen.routeName);
                                      },
                                      child: Text(
                                        "Log In",
                                        style: buttonTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 1,
                          margin: const EdgeInsets.only(bottom: 30),
                          color: const Color(0xFFEEEEEE)),
                    ],
                  ),
                  const ListItem(
                      imageUrl: 'assets/images/ecorp.png',
                      title: listItemTitleText,
                      description: listItemPreviewText),
                  divider,
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
