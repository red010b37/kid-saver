import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BucketViewHeaderTotalWidget extends StatefulWidget {
  const BucketViewHeaderTotalWidget({
    Key key,
    this.height,
    this.totatCents,
    this.bgColor,
    this.bucketType,
    this.goalTotalCents,
    this.goalBarDisplayTxt,
    this.barProgressPercent,
  }) : super(key: key);

  final int height;
  final int totatCents;
  final Color bgColor;
  final String bucketType;
  final int goalTotalCents;
  final String goalBarDisplayTxt;
  final double barProgressPercent;

  @override
  _BucketViewHeaderTotalWidgetState createState() =>
      _BucketViewHeaderTotalWidgetState();
}

class _BucketViewHeaderTotalWidgetState
    extends State<BucketViewHeaderTotalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.height.toDouble(),
      decoration: BoxDecoration(
        color: widget.bgColor,
      ),
      child: Stack(
        children: [
          if ((widget.bucketType) != 'goal')
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: AutoSizeText(
                        valueOrDefault<String>(
                          functions.formatCents(widget.totatCents),
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 58,
                              fontWeight: FontWeight.w300,
                              lineHeight: 1.2,
                            ),
                      ),
                    ),
                  ],
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '2ze5ewya' /* Total */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          if ((widget.bucketType) == 'goal')
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: AutoSizeText(
                        valueOrDefault<String>(
                          functions.formatCents(widget.totatCents),
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 58,
                              fontWeight: FontWeight.w300,
                              lineHeight: 1.2,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'bw3rdreo' /* Of  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      valueOrDefault<String>(
                        functions.formatCents(widget.goalTotalCents),
                        '\$0.00',
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
                LinearPercentIndicator(
                  percent: 0.5,
                  width: MediaQuery.of(context).size.width,
                  lineHeight: 24,
                  animation: true,
                  progressColor: FlutterFlowTheme.of(context).primaryColor,
                  backgroundColor: Color(0x2E0E164D),
                  center: Text(
                    widget.goalBarDisplayTxt,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
