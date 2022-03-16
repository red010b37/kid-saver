// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// Begin custom widget code
class CustomeGoalWidget extends StatefulWidget {
  const CustomeGoalWidget({
    Key key,
    this.width,
    this.height,
    this.colorStr,
    this.name,
    this.totalInCents,
    this.goalTotalInCents,
  }) : super(key: key);

  final double width;
  final double height;
  final String colorStr;
  final String name;
  final int totalInCents;
  final int goalTotalInCents;

  @override
  _CustomeGoalWidgetState createState() => _CustomeGoalWidgetState();
}

class _CustomeGoalWidgetState extends State<CustomeGoalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
