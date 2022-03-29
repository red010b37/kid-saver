import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../child_dashboard/child_dashboard_widget.dart';
import '../components/colors_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateEditSpendableBucketWidget extends StatefulWidget {
  const CreateEditSpendableBucketWidget({
    Key key,
    this.bucketRef,
    this.isAnEdit,
  }) : super(key: key);

  final BucketsRecord bucketRef;
  final bool isAnEdit;

  @override
  _CreateEditSpendableBucketWidgetState createState() =>
      _CreateEditSpendableBucketWidgetState();
}

class _CreateEditSpendableBucketWidgetState
    extends State<CreateEditSpendableBucketWidget> {
  TextEditingController descTextFieldController;
  TextEditingController nameTextFieldController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BucketsRecord>(
      stream: BucketsRecord.getDocument(widget.bucketRef.reference),
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
        final createEditSpendableBucketBucketsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 50,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                if (!(widget.isAnEdit) ?? true)
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 0, 0),
                                      child: Text(
                                        'Create Spendable Bucket',
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                      ),
                                    ),
                                  ),
                                if (widget.isAnEdit ?? true)
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 0, 0),
                                      child: Text(
                                        'Edit ${createEditSpendableBucketBucketsRecord.name}',
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [],
              elevation: 2,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 500,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Form(
                            key: formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: ColorsWidget(
                                              bucket: widget.bucketRef,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 30, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'kyyh14re' /* Bucket Color */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  fontSize: 18,
                                                ),
                                          ),
                                        ),
                                        custom_widgets.ColorSwatch(
                                          width: 50,
                                          height: 50,
                                          colorStr:
                                              createEditSpendableBucketBucketsRecord
                                                  .color,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: TextFormField(
                                    controller: nameTextFieldController ??=
                                        TextEditingController(
                                      text:
                                          createEditSpendableBucketBucketsRecord
                                              .name,
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xF50E164D),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xF00E164D),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return FFLocalizations.of(context)
                                            .getText(
                                          'c6a2nnx2' /* Field is required */,
                                        );
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: TextFormField(
                                    controller: descTextFieldController ??=
                                        TextEditingController(
                                      text:
                                          createEditSpendableBucketBucketsRecord
                                              .description,
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Description',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                  ),
                                ),
                                if (!(widget.isAnEdit) ?? true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (!formKey.currentState.validate()) {
                                          return;
                                        }

                                        final bucketsUpdateData =
                                            createBucketsRecordData(
                                          updatedAt: getCurrentTimestamp,
                                          name: nameTextFieldController?.text ??
                                              '',
                                          description:
                                              descTextFieldController?.text ??
                                                  '',
                                          totalCents: 0,
                                          lastSeenTotalCents: 0,
                                          canUserDelete: true,
                                          state: 'active',
                                          type: 'spendable',
                                        );
                                        await createEditSpendableBucketBucketsRecord
                                            .reference
                                            .update(bucketsUpdateData);
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChildDashboardWidget(
                                              userAccountRef:
                                                  createEditSpendableBucketBucketsRecord
                                                      .userAccountRef,
                                            ),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'n58dqvs6' /* Create */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
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
                                  ),
                                if (widget.isAnEdit ?? true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (!formKey.currentState.validate()) {
                                          return;
                                        }

                                        final bucketsUpdateData =
                                            createBucketsRecordData(
                                          updatedAt: getCurrentTimestamp,
                                          name: nameTextFieldController?.text ??
                                              '',
                                          description:
                                              descTextFieldController?.text ??
                                                  '',
                                          totalCents: 0,
                                          lastSeenTotalCents: 0,
                                          canUserDelete: true,
                                          state: 'active',
                                          type: 'spendable',
                                        );
                                        await createEditSpendableBucketBucketsRecord
                                            .reference
                                            .update(bucketsUpdateData);
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChildDashboardWidget(
                                              userAccountRef:
                                                  createEditSpendableBucketBucketsRecord
                                                      .userAccountRef,
                                            ),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '6nyx7pko' /* Edit */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
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
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                  ),
                                ),
                                if (widget.isAnEdit ?? true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if ((createEditSpendableBucketBucketsRecord
                                                .totalCents) ==
                                            0) {
                                          final bucketsUpdateData =
                                              createBucketsRecordData(
                                            updatedAt: getCurrentTimestamp,
                                            state: 'archived',
                                          );
                                          await createEditSpendableBucketBucketsRecord
                                              .reference
                                              .update(bucketsUpdateData);
                                        } else {
                                          return;
                                        }

                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChildDashboardWidget(
                                              userAccountRef:
                                                  createEditSpendableBucketBucketsRecord
                                                      .userAccountRef,
                                            ),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'mjkboks0' /* Remove */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 60,
                                        color: Color(0xFFE90000),
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
                                  ),
                                Text(
                                  'The bucket needs to be \$0.00 \nbefore it can be removed',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
