// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// Automatic FlutterFlow imports
import 'package:kid_saver/bucket_view/bucket_view_widget.dart';

import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code

import 'package:auto_size_text/auto_size_text.dart';
import 'package:kid_saver/flutter_flow/custom_functions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
  _GoalWidgetState createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<CustomeGoalWidget> {
  @override
  Widget build(BuildContext context) {
    var tc = widget.totalInCents;
    var gtc = widget.goalTotalInCents;

    var t = 0.0;
    if (gtc != 0 && tc != 0) {
      t = tc.toDouble() / gtc.toDouble();
    }

    int value = int.parse(widget.colorStr);
    Color bgColor = Color(value).withOpacity(1);
    Color inicatorBgC = Color(value).withOpacity(.3);

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Stack(
        alignment: AlignmentDirectional(0, 0),
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: CircularPercentIndicator(
                percent: t,
                radius: widget.width / 2,
                lineWidth: 9,
                animation: true,
                progressColor: bgColor,
                backgroundColor: inicatorBgC,
                circularStrokeCap: CircularStrokeCap.round,
                startAngle: 270),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: InkWell(
              onTap: () async {
                await await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BucketViewWidget(),
                  ),
                );
              },
              child: Container(
                width: widget.width - 30,
                height: widget.height - 30,
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              widget.name,
                              minFontSize: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              formatCents(widget.totalInCents),
                              textAlign: TextAlign.center,
                              minFontSize: 2,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              'of ${formatCents(widget.goalTotalInCents)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
