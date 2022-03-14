import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildDashboardWidget extends StatefulWidget {
  const ChildDashboardWidget({
    Key key,
    this.userAccountRef,
  }) : super(key: key);

  final DocumentReference userAccountRef;

  @override
  _ChildDashboardWidgetState createState() => _ChildDashboardWidgetState();
}

class _ChildDashboardWidgetState extends State<ChildDashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserAccountRecord>(
      stream: UserAccountRecord.getDocument(widget.userAccountRef),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final childDashboardUserAccountRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: StreamBuilder<List<BucketsRecord>>(
                  stream: queryBucketsRecord(
                    queryBuilder: (bucketsRecord) => bucketsRecord
                        .where('user_account_ref',
                            isEqualTo: widget.userAccountRef)
                        .where('account_ref',
                            isEqualTo:
                                childDashboardUserAccountRecord.accountRef),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<BucketsRecord> containerBucketsRecordList =
                        snapshot.data;
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 3,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    childDashboardUserAccountRecord.displayName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        valueOrDefault<String>(
                                          functions.formatCents(
                                              childDashboardUserAccountRecord
                                                  .totalCents),
                                          '0',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 58,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Total',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                custom_widgets.KidsHomeMasonLayout(
                                  width: MediaQuery.of(context).size.width,
                                  buckets: containerBucketsRecordList.toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
