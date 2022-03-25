// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:kid_saver/components/bucket_view_header_total_widget.dart';

class WrapBucketViewHeaderTotal extends StatefulWidget {
  const WrapBucketViewHeaderTotal({
    Key key,
    this.width,
    this.height,
    this.bucketRecord,
  }) : super(key: key);

  final double width;
  final double height;
  final BucketsRecord bucketRecord;

  @override
  _WrapBucketViewHeaderTotalState createState() =>
      _WrapBucketViewHeaderTotalState();
}

class _WrapBucketViewHeaderTotalState extends State<WrapBucketViewHeaderTotal> {
  @override
  Widget build(BuildContext context) {
    int value = int.parse(widget.colorStr);
    Color color = Color(value).withOpacity(1);

    return BucketViewHeaderTotalWidget(
      height: widget.height.toInt(),
      totatCents: widget.totalCents,
      bgColor: color,
    );
  }
}
