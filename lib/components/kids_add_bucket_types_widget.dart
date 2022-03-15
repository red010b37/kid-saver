import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_spendable_bucket/create_spendable_bucket_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KidsAddBucketTypesWidget extends StatefulWidget {
  const KidsAddBucketTypesWidget({
    Key key,
    this.userAccountRf,
    this.accountRef,
  }) : super(key: key);

  final DocumentReference userAccountRf;
  final DocumentReference accountRef;

  @override
  _KidsAddBucketTypesWidgetState createState() =>
      _KidsAddBucketTypesWidgetState();
}

class _KidsAddBucketTypesWidgetState extends State<KidsAddBucketTypesWidget>
    with TickerProviderStateMixin {
  BucketsRecord bucketRecord;
  final animationsMap = {
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 250,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(300, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

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
                  await (animationsMap['columnOnActionTriggerAnimation']
                          .curvedAnimation
                          .parent as AnimationController)
                      .forward(from: 0.0);
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
          if (FFAppState().uiIsAddBucketMenuOpen ?? true)
            Align(
              alignment: AlignmentDirectional(1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 80),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: InkWell(
                        onTap: () async {
                          final bucketsCreateData = createBucketsRecordData(
                            state: 'pending',
                            createdAt: getCurrentTimestamp,
                            updatedAt: getCurrentTimestamp,
                            userAccountRef: widget.userAccountRf,
                            accountRef: widget.accountRef,
                          );
                          var bucketsRecordReference =
                              BucketsRecord.collection.doc();
                          await bucketsRecordReference.set(bucketsCreateData);
                          bucketRecord = BucketsRecord.getDocumentFromData(
                              bucketsCreateData, bucketsRecordReference);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateSpendableBucketWidget(
                                bucketRef: bucketRecord,
                              ),
                            ),
                          );

                          setState(() {});
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 8, 0),
                                    child: Text(
                                      'Spending Bucket',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 50,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    icon: Icon(
                                      Icons.attach_money_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: Text(
                                    'Goal Bucket',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  icon: Icon(
                                    Icons.cake_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Text(
                                  'Savings Bucket',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 50,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                icon: Icon(
                                  Icons.sentiment_very_satisfied_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 25,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ).animated([animationsMap['columnOnActionTriggerAnimation']]),
              ),
            ),
        ],
      ),
    );
  }
}
