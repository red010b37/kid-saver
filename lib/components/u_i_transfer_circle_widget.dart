import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UITransferCircleWidget extends StatefulWidget {
  const UITransferCircleWidget({
    Key key,
    this.radius,
    this.bgColor,
    this.title,
    this.transferDirection,
    this.totalCents,
  }) : super(key: key);

  final double radius;
  final Color bgColor;
  final String title;
  final String transferDirection;
  final int totalCents;

  @override
  _UITransferCircleWidgetState createState() => _UITransferCircleWidgetState();
}

class _UITransferCircleWidgetState extends State<UITransferCircleWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: const CircleBorder(),
      child: Container(
        width: widget.radius,
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
              widget.transferDirection,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    fontWeight: FontWeight.w300,
                  ),
            ),
            AutoSizeText(
              functions.formatCents(widget.totalCents),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
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
