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

  final _clock = DateTime.now();
  var elapsed =
      _clock.millisecondsSinceEpoch - timeToFormat.millisecondsSinceEpoch;

  String prefix, suffix;

  if (elapsed < 0) {
    elapsed = timeToFormat.isBefore(_clock) ? elapsed : elapsed.abs();
    prefix = '';
    suffix = 'from now';
  } else {
    prefix = '';
    suffix = 'ago';
  }

  final num seconds = elapsed / 1000;
  final num minutes = seconds / 60;
  final num hours = minutes / 60;
  final num days = hours / 24;
  final num months = days / 30;
  final num years = days / 365;

  String result;
  if (seconds < 45) {
    result = 'a moment';
  } else if (seconds < 90) {
    result = 'a minute';
  } else if (minutes < 45) {
    result = '${minutes.round()} minutes';
  } else if (minutes < 90) {
    result = 'about an hour';
  } else if (hours < 24) {
    result = '${hours.round()} hours';
  } else if (hours < 48) {
    result = 'a day';
  } else if (days < 30) {
    result = '${days.round()} days';
  } else if (days < 60) {
    result = 'about a month';
  } else if (days < 365) {
    result = '${months.round()} months';
  } else if (years < 2) {
    result = 'about a year';
  } else {
    result = '${years.round()} years';
  }

  return [prefix, result, suffix].where((str) => str.isNotEmpty).join(' ');
}
