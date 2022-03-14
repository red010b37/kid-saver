import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KidsAddBucketTypesWidget extends StatefulWidget {
  const KidsAddBucketTypesWidget({Key key}) : super(key: key);

  @override
  _KidsAddBucketTypesWidgetState createState() =>
      _KidsAddBucketTypesWidgetState();
}

class _KidsAddBucketTypesWidgetState extends State<KidsAddBucketTypesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 10),
      child: Stack(
        children: [
          if (!(FFAppState().uiIsAddBucketMenuOpen) ?? true)
            Align(
              alignment: AlignmentDirectional(1, 1),
              child: InkWell(
                onTap: () async {
                  setState(() => FFAppState().uiIsAddBucketMenuOpen = true);
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: const CircleBorder(),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          if (FFAppState().uiIsAddBucketMenuOpen ?? true)
            Align(
              alignment: AlignmentDirectional(1, 1),
              child: InkWell(
                onTap: () async {
                  setState(() => FFAppState().uiIsAddBucketMenuOpen = false);
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: const CircleBorder(),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8529),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
