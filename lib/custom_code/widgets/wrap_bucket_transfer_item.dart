// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code

import 'package:kids_saver/components/bucket_transfer_item_widget.dart';

class WrapBucketTransferItem extends StatefulWidget {
  const WrapBucketTransferItem({
    Key key,
    this.width,
    this.height,
    this.radius,
    this.bgColor,
    this.title,
    this.totalCents,
    this.type,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;
  final String bgColor;
  final String title;
  final int totalCents;
  final String type;

  @override
  _WrapBucketTransferItemState createState() => _WrapBucketTransferItemState();
}

class _WrapBucketTransferItemState extends State<WrapBucketTransferItem> {
  @override
  Widget build(BuildContext context) {
    int value = int.parse(widget.bgColor);
    Color color = Color(value).withOpacity(1);

    return BucketTransferItemWidget(
      title: widget.title,
      type: widget.type,
      totalCents: widget.totalCents,
      radius: widget.radius,
      bgColor: color,
    );
  }
}
