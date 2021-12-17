import 'package:flutter/material.dart';

bool isLoggedIn = true;

String userEmail = 'default@def.com';

String fromCity = '';
String toCity = '';

final departure = ValueNotifier("dept");
final arrival = ValueNotifier("arr");

final numberOfPassengers = ValueNotifier(1);

final chosenInsurance = ValueNotifier("");
