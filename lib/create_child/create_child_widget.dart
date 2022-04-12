import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/user_avatar_selector_widget.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../guardian_dashboard/guardian_dashboard_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateChildWidget extends StatefulWidget {
  const CreateChildWidget({
    Key key,
    this.createdUserAccountRef,
    this.accountRef,
    this.guardingUserAccontRef,
  }) : super(key: key);

  final DocumentReference createdUserAccountRef;
  final DocumentReference accountRef;
  final DocumentReference guardingUserAccontRef;

  @override
  _CreateChildWidgetState createState() => _CreateChildWidgetState();
}

class _CreateChildWidgetState extends State<CreateChildWidget> {
  DateTime datePicked;
  TextEditingController textController;
  String radioButtonValue;
  String uploadedFileUrl = '';
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserAccountRecord>(
      stream: UserAccountRecord.getDocument(widget.createdUserAccountRef),
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
        final createChildUserAccountRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
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
                        color: Color(0xFF0E164D),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '29d65kyd' /* Add Child */,
                                  ),
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                              ),
                              Container(
                                height: 150,
                                child: Stack(
                                  alignment: AlignmentDirectional(0, 0),
                                  children: [
                                    Image.asset(
                                      'assets/images/select_screen_circles.png',
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0.1),
                                      child: InkWell(
                                        onTap: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            allowPhoto: true,
                                            pickerFontFamily: 'Lexend Deca',
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            final downloadUrls =
                                                await Future.wait(selectedMedia
                                                    .map((m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes)));
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            if (downloadUrls != null) {
                                              setState(() => uploadedFileUrl =
                                                  downloadUrls.first);
                                              showUploadMessage(
                                                context,
                                                'Success!',
                                              );
                                            } else {
                                              showUploadMessage(
                                                context,
                                                'Failed to upload media',
                                              );
                                              return;
                                            }
                                          }

                                          final userAccountUpdateData =
                                              createUserAccountRecordData(
                                            profileImagePath: uploadedFileUrl,
                                          );
                                          await widget.createdUserAccountRef
                                              .update(userAccountUpdateData);
                                        },
                                        child: Container(
                                          width: 125,
                                          height: 125,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              createChildUserAccountRecord
                                                  .profileImagePath,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kid-saver-il699v/assets/o985htoj7n09/profileselect.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'o0k2r7xx' /* Upload image or select one of ... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xDBFFFFFF),
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 20),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: UserAvatarSelectorWidget(
                                              userAccountRef:
                                                  widget.createdUserAccountRef,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '7g4kot2w' /* Select Avatar */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFFFFB129),
                                          ),
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1,
                                      ),
                                      borderRadius: 10,
                                    ),
                                  ),
                                ),
                              ),
                              Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: TextFormField(
                                        controller: textController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Child Name',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFAFFFFFF),
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'x6f8252l' /* Child Name */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFCFFFFFF),
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF01CC88),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF01CC88),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await DatePicker.showDatePicker(
                                              context,
                                              showTitleActions: true,
                                              onConfirm: (date) {
                                                setState(
                                                    () => datePicked = date);
                                              },
                                              currentTime: getCurrentTimestamp,
                                              minTime: DateTime(0, 0, 0),
                                              locale:
                                                  LocaleType.values.firstWhere(
                                                (l) =>
                                                    l.name ==
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                                orElse: null,
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                width: 1,
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    dateTimeFormat(
                                                        'yMMMd', datePicked),
                                                    'DOB',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: FlutterFlowRadioButton(
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            'z0hlkdog' /* Boy */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '2w2a9rti' /* Girl */,
                                          )
                                        ].toList(),
                                        onChanged: (value) {
                                          setState(
                                              () => radioButtonValue = value);
                                        },
                                        optionHeight: 40,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        buttonPosition:
                                            RadioButtonPosition.left,
                                        direction: Axis.vertical,
                                        radioButtonColor: Color(0xFF01CC88),
                                        inactiveRadioButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        toggleable: false,
                                        horizontalAlignment:
                                            WrapAlignment.start,
                                        verticalAlignment:
                                            WrapCrossAlignment.start,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await createChildUserAccountRecord
                                                  .reference
                                                  .delete();
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      GuardianDashboardWidget(
                                                    userAccountRref: widget
                                                        .guardingUserAccontRef,
                                                  ),
                                                ),
                                              );
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'haia0n7n' /* Cancel */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 60,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              final userAccountUpdateData =
                                                  createUserAccountRecordData(
                                                name: textController.text,
                                                displayName:
                                                    textController.text,
                                                gender: radioButtonValue,
                                                dob: datePicked,
                                                updatedAt: getCurrentTimestamp,
                                                accountRef: widget.accountRef,
                                                relationship: 'child',
                                                state: 'active',
                                                spendableCents: 0,
                                                totalCents: 0,
                                                lastSeenTotalCents: 0,
                                              );
                                              await createChildUserAccountRecord
                                                  .reference
                                                  .update(
                                                      userAccountUpdateData);
                                              await actions
                                                  .createDefaultBuckets(
                                                widget.createdUserAccountRef,
                                                widget.accountRef,
                                              );
                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      GuardianDashboardWidget(
                                                    userAccountRref: widget
                                                        .guardingUserAccontRef,
                                                  ),
                                                ),
                                                (r) => false,
                                              );
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'o4sm4tkz' /* Add */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 60,
                                              color: Color(0xFFFF2E63),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
