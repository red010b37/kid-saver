import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RemoveAmountComponentWidget extends StatefulWidget {
  const RemoveAmountComponentWidget({
    Key key,
    this.stagingAmountRed,
  }) : super(key: key);

  final DocumentReference stagingAmountRed;

  @override
  _RemoveAmountComponentWidgetState createState() =>
      _RemoveAmountComponentWidgetState();
}

class _RemoveAmountComponentWidgetState
    extends State<RemoveAmountComponentWidget> {
  TextEditingController removeAmtTextFieldController;
  TextEditingController textController2;

  @override
  void initState() {
    super.initState();
    removeAmtTextFieldController = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StagingAmountRecord>(
      stream: StagingAmountRecord.getDocument(widget.stagingAmountRed),
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
        final stackStagingAmountRecord = snapshot.data;
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            alignment: AlignmentDirectional(0, 0),
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'yeqr46n5' /* Remove Amount */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: TextFormField(
                                controller: removeAmtTextFieldController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    '5ac4rgpe' /* 0.00 */,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.attach_money,
                                    color: Color(0xDBFFFFFF),
                                    size: 48,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 49,
                                      fontWeight: FontWeight.normal,
                                    ),
                                textAlign: TextAlign.end,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'z6fb0kvl' /* The amount will be added to ea... */,
                              ),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w100,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                            child: TextFormField(
                              controller: textController2,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  'rxnddnmj' /* Description (optional) */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: StreamBuilder<
                                  List<StagingAmountBucketsRecord>>(
                                stream: queryStagingAmountBucketsRecord(
                                  queryBuilder: (stagingAmountBucketsRecord) =>
                                      stagingAmountBucketsRecord.where(
                                          'staging_amount_ref',
                                          isEqualTo: widget.stagingAmountRed),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<StagingAmountBucketsRecord>
                                      listViewStagingAmountBucketsRecordList =
                                      snapshot.data;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewStagingAmountBucketsRecordList
                                            .length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewStagingAmountBucketsRecord =
                                          listViewStagingAmountBucketsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: FutureBuilder<BucketsRecord>(
                                          future: BucketsRecord.getDocumentOnce(
                                              listViewStagingAmountBucketsRecord
                                                  .bucketRef),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              );
                                            }
                                            final itemRowBucketsRecord =
                                                snapshot.data;
                                            return InkWell(
                                              onTap: () async {
                                                final stagingAmountBucketsUpdateData =
                                                    createStagingAmountBucketsRecordData(
                                                  isSelected:
                                                      !(listViewStagingAmountBucketsRecord
                                                          .isSelected),
                                                );
                                                await listViewStagingAmountBucketsRecord
                                                    .reference
                                                    .update(
                                                        stagingAmountBucketsUpdateData);
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        itemRowBucketsRecord
                                                            .name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 5, 0, 0),
                                                        child: Text(
                                                          formatNumber(
                                                            itemRowBucketsRecord
                                                                .lastSeenTotalCents,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: '',
                                                            format: '',
                                                            locale: '',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ToggleIcon(
                                                    onPressed: () async {
                                                      final stagingAmountBucketsUpdateData =
                                                          createStagingAmountBucketsRecordData(
                                                        isSelected:
                                                            !listViewStagingAmountBucketsRecord
                                                                .isSelected,
                                                      );
                                                      await listViewStagingAmountBucketsRecord
                                                          .reference
                                                          .update(
                                                              stagingAmountBucketsUpdateData);
                                                    },
                                                    value:
                                                        listViewStagingAmountBucketsRecord
                                                            .isSelected,
                                                    onIcon: Icon(
                                                      Icons.check_box,
                                                      color: Color(0xFF0E164D),
                                                      size: 30,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons
                                                          .check_box_outline_blank,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              final stagingAmountUpdateData =
                                  createStagingAmountRecordData(
                                state: 'complete',
                                amount: double.parse(
                                    removeAmtTextFieldController.text),
                              );
                              await stackStagingAmountRecord.reference
                                  .update(stagingAmountUpdateData);
                              await actions.calculateAmounts(
                                widget.stagingAmountRed,
                              );
                              Navigator.pop(context);
                            },
                            text: FFLocalizations.of(context).getText(
                              '0o4rrxwl' /* Remove */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 55,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, -1),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.close,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 30,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
