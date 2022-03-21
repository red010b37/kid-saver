import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KidsListEmptyWidget extends StatefulWidget {
  const KidsListEmptyWidget({Key key}) : super(key: key);

  @override
  _KidsListEmptyWidgetState createState() => _KidsListEmptyWidgetState();
}

class _KidsListEmptyWidgetState extends State<KidsListEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiaryColor,
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Text(
              FFLocalizations.of(context).getText(
                'yxiv934b' /* Use  the button below to add  ... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0x8CFFFFFF),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
