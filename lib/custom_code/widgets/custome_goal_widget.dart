// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code

import 'package:auto_size_text/auto_size_text.dart';
import 'package:kid_saver/flutter_flow/custom_functions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
  _GoalWidgetState createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<CustomeGoalWidget> {
  @override
  Widget build(BuildContext context) {
    var t = widget.goalTotalInCents / widget.totalInCents;

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Stack(
        alignment: AlignmentDirectional(0, 0),
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: CircularPercentIndicator(
                percent: t,
                radius: 115,
                lineWidth: 9,
                animation: true,
                progressColor: FlutterFlowTheme.of(context).secondaryColor,
                backgroundColor: Color(0x2DFF2E63),
                startAngle: 270),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryColor,
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
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).subtitle1,
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'of ' + formatCents(widget.goalTotalInCents),
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
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
        ],
      ),
    );
  }
}
