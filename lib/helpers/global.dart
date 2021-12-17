import 'package:flutter/material.dart';

bool isLoggedIn = true;

String userEmail = 'kathi@gmail.com';

String fromCity = '';
String toCity = '';

final departure = ValueNotifier("dept");
final arrival = ValueNotifier("arr");

final numberOfPassengers = ValueNotifier(1);

final chosenInsuranceCount = ValueNotifier(0);

var insuranceCount = {};
var insuranceCost = {};
var insuranceDesc = {};
