import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsWidget extends StatefulWidget {
  const ColorsWidget({
    Key key,
    this.bucket,
  }) : super(key: key);

  final BucketsRecord bucket;

  @override
  _ColorsWidgetState createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
