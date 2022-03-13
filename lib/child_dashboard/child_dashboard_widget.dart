import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildDashboardWidget extends StatefulWidget {
  const ChildDashboardWidget({Key key}) : super(key: key);

  @override
  _ChildDashboardWidgetState createState() => _ChildDashboardWidgetState();
}

class _ChildDashboardWidgetState extends State<ChildDashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
    );
  }
}
