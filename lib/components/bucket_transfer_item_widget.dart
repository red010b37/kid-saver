import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BucketTransferItemWidget extends StatefulWidget {
  const BucketTransferItemWidget({
    Key key,
    this.bgColor,
    this.title,
    this.totalCents,
    this.type,
    this.radius,
  }) : super(key: key);

  final Color bgColor;
  final String title;
  final int totalCents;
  final String type;
  final int radius;

  @override
  _BucketTransferItemWidgetState createState() =>
      _BucketTransferItemWidgetState();
}

class _BucketTransferItemWidgetState extends State<BucketTransferItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: const CircleBorder(),
      child: Container(
        width: widget.radius.toDouble(),
        height: 100,
        decoration: BoxDecoration(
          color: widget.bgColor,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'From',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    fontWeight: FontWeight.w300,
                  ),
            ),
            AutoSizeText(
              functions.formatCents(widget.totalCents),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            Text(
              widget.title,
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
