import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String formatCents(int cents) {
  // Add your function code here!
  var format = NumberFormat.simpleCurrency(decimalDigits: 2);
  return format.format(cents / 100);
}

String generateRandomColoStr() {
  const List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.blueGrey,
    Colors.black,
  ];

  var r = math.Random().nextInt(colors.length - 1);
  return colors[r].value.toString();
}

int formInputToCents(String formInput) {
  // Add your function code here!
  var i = double.parse(formInput) * 100;
  return i.toInt();
}

String fomatTimeToTimeago(DateTime timeToFormat) {
  // Add your function code here!

  return "";
}
