// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:kids_saver/components/bucket_view_header_total_widget.dart';

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
    int value = int.parse(widget.bucketRecord.color);
    Color color = Color(value).withOpacity(1);

    var bgt = '0.00';
    var goalTotalCent = 0;
    var percent = 0.0;

    if (widget.bucketRecord.type == 'goal') {
      goalTotalCent = widget.bucketRecord.goalAmountCents;

      var tc = widget.bucketRecord.totalCents;
      var gtc = widget.bucketRecord.goalAmountCents;

      if (gtc != 0 && tc != 0) {
        percent = ((tc.toDouble() / gtc.toDouble()) * 100) / 100;
      }
      if (percent > 1.0) {
        percent = 1.0;
      }

      bgt = formatCents(tc);
    }

    return BucketViewHeaderTotalWidget(
      height: widget.height.toInt(),
      totatCents: widget.bucketRecord.totalCents,
      bgColor: color,
      bucketType: widget.bucketRecord.type,
      goalTotalCents: goalTotalCent,
      goalBarDisplayTxt: bgt,
      barProgressPercent: percent,
    );
  }
}
