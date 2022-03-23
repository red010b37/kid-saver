import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BucketViewHeaderTotalWidget extends StatefulWidget {
  const BucketViewHeaderTotalWidget({
    Key key,
    this.height,
    this.totatCents,
    this.bgColor,
  }) : super(key: key);

  final int height;
  final int totatCents;
  final Color bgColor;

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
        color: FlutterFlowTheme.of(context).alternate,
      ),
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
        ],
      ),
    );
  }
}
