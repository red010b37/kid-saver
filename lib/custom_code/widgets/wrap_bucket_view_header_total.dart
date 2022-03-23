// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code

class WrapBucketViewHeaderTotal extends StatefulWidget {
  const WrapBucketViewHeaderTotal({
    Key key,
    this.width,
    this.height,
    this.totalCents,
    this.colorStr,
  }) : super(key: key);

  final double width;
  final double height;
  final int totalCents;
  final String colorStr;

  @override
  _WrapBucketViewHeaderTotalState createState() =>
      _WrapBucketViewHeaderTotalState();
}

class _WrapBucketViewHeaderTotalState extends State<WrapBucketViewHeaderTotal> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
