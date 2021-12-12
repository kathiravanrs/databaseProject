import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_example/display_page.dart';
import 'package:login_example/page_list.dart';
import 'package:login_example/widgets/flight_details.dart';
import 'package:login_example/widgets/insurance_details.dart';
import 'package:login_example/widgets/invoice_details.dart';
import 'package:login_example/widgets/payment_details.dart';
import 'package:login_example/widgets/profile_screen.dart';
import 'package:login_example/widgets/registration_screen.dart';

import 'dashboard_screen.dart';
import 'login_screen.dart';
import 'transition_route_observer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safe Fly Management Excellence',
      theme: ThemeData(
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.red),
        // fontFamily: 'SourceSansPro',
        textTheme: const TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Colors.red,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.white70,
          ),
          headline1: TextStyle(fontFamily: 'Quicksand'),
          headline2: TextStyle(fontFamily: 'Quicksand'),
          headline4: TextStyle(fontFamily: 'Quicksand'),
          headline5: TextStyle(fontFamily: 'NotoSans'),
          headline6: TextStyle(fontFamily: 'NotoSans'),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
          subtitle2: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: Colors.orange),
      ),
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: HomePage.routeName,
      routes: {
        RegistrationScreen.routeName: (context) => RegistrationScreen(),
        HomePage.routeName: (context) => HomePage(),
        LoginScreen.routeName: (context) => LoginScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
        FlightDetails.routeName: (context) => FlightDetails(),
        DisplayPage.routeName: (context) => DisplayPage(),
        InsuranceDetails.routeName: (context) => InsuranceDetails(),
        InvoiceDetails.routeName: (context) => InvoiceDetails(),
        PaymentDetails.routeName: (context) => PaymentDetails(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
