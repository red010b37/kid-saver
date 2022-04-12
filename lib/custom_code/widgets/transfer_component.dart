// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class TransferComponent extends StatefulWidget {
  const TransferComponent({
    Key key,
    this.width,
    this.height,
    this.record,
  }) : super(key: key);

  final double width;
  final double height;
  final BucketsRecord record;

  @override
  _TransferComponentState createState() => _TransferComponentState();
}

class _TransferComponentState extends State<TransferComponent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
