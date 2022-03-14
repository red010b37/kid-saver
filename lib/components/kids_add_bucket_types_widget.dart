import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
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
    return Stack(
      children: [
        if (!(FFAppState().uiIsAddBucketMenuOpen) ?? true)
          Align(
            alignment: AlignmentDirectional(0.95, 0.95),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => FFAppState().uiIsAddBucketMenuOpen = true);
              },
              text: '',
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 40,
              ),
              options: FFButtonOptions(
                width: 70,
                height: 70,
                color: Color(0xFFFF2E63),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                    ),
                elevation: 2,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 70,
              ),
            ),
          ),
        if (FFAppState().uiIsAddBucketMenuOpen ?? true)
          Align(
            alignment: AlignmentDirectional(0.95, 0.95),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => FFAppState().uiIsAddBucketMenuOpen = false);
              },
              text: '',
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 40,
              ),
              options: FFButtonOptions(
                width: 70,
                height: 70,
                color: Color(0xFFFF8529),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                    ),
                elevation: 2,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 70,
              ),
            ),
          ),
      ],
    );
  }
}
