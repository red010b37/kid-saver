// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// Begin custom widget code
class ColorSwatch extends StatefulWidget {
  const ColorSwatch({
    Key key,
    this.width,
    this.height,
    this.colorStr,
  }) : super(key: key);

  final double width;
  final double height;
  final String colorStr;

  @override
  _ColorSwatchState createState() => _ColorSwatchState();
}

class _ColorSwatchState extends State<ColorSwatch> {
  @override
  Widget build(BuildContext context) {
    var value = int.parse(widget.colorStr);
    var color = Color(value).withOpacity(1);

    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: const CircleBorder(),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
