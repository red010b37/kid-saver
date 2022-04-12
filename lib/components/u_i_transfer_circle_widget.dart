import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UITransferCircleWidget extends StatefulWidget {
  const UITransferCircleWidget({
    Key key,
    this.radius,
    this.bgColor,
    this.title,
    this.transferDirection,
  }) : super(key: key);

  final double radius;
  final Color bgColor;
  final String title;
  final String transferDirection;

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
      ),
    );
  }
}
