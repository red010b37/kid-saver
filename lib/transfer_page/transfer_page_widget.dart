import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransferPageWidget extends StatefulWidget {
  const TransferPageWidget({
    Key key,
    this.fromBucketDocument,
  }) : super(key: key);

  final BucketsRecord fromBucketDocument;

  @override
  _TransferPageWidgetState createState() => _TransferPageWidgetState();
}

class _TransferPageWidgetState extends State<TransferPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Transfer',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  custom_widgets.WrapBucketTransferItem(
                    width: 200,
                    height: 200,
                    radius: 200.0,
                    bgColor: widget.fromBucketDocument.color,
                    title: widget.fromBucketDocument.name,
                    totalCents: widget.fromBucketDocument.totalCents,
                    type: widget.fromBucketDocument.type,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
