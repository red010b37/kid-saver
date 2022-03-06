import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/onboarding_avatar_selector_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../kids_list/kids_list_widget.dart';
import '../o_b_get_started/o_b_get_started_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OBProfileImageWidget extends StatefulWidget {
  const OBProfileImageWidget({
    Key key,
    this.onboardingRef,
  }) : super(key: key);

  final DocumentReference onboardingRef;

  @override
  _OBProfileImageWidgetState createState() => _OBProfileImageWidgetState();
}

class _OBProfileImageWidgetState extends State<OBProfileImageWidget>
    with TickerProviderStateMixin {
  AccountRecord accountRecord;
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      initialState: AnimationState(
        offset: Offset(0, 400),
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
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/splash_two.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: StreamBuilder<OnboardingRecord>(
                stream: OnboardingRecord.getDocument(widget.onboardingRef),
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
                  final containerOnboardingRecord = snapshot.data;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 480,
                    constraints: BoxConstraints(
                      maxWidth: 500,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Color(0x30000000),
                          offset: Offset(1, 0),
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Image.asset(
                                  'assets/images/yellow-dash.png',
                                  width: 72,
                                  height: 6,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Text(
                                  'How you look',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                ),
                              ),
                              Text(
                                'Upload a photo or use on of ours avatars',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            validateFileFormat(
                                                selectedMedia.storagePath,
                                                context)) {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          final downloadUrl = await uploadData(
                                              selectedMedia.storagePath,
                                              selectedMedia.bytes);
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          if (downloadUrl != null) {
                                            setState(() =>
                                                uploadedFileUrl = downloadUrl);
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
                                      },
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          containerOnboardingRecord
                                              .profileImagePath,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kid-saver-il699v/assets/o985htoj7n09/profileselect.png',
                                        ),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'or',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF9E9E9E),
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: OnboardingAvatarSelectorWidget(
                                            onboardingRef: widget.onboardingRef,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  text: 'Select Avatar',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 55,
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          lineHeight: 1,
                                        ),
                                    borderSide: BorderSide(
                                      color: Color(0xFFFF2E63),
                                      width: 1,
                                    ),
                                    borderRadius: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final user =
                                        await signInAnonymously(context);
                                    if (user == null) {
                                      return;
                                    }
                                    final accountCreateData =
                                        createAccountRecordData(
                                      ownerRef: currentUserReference,
                                      state: 'active',
                                      createdAt: getCurrentTimestamp,
                                      updatedAt: getCurrentTimestamp,
                                    );
                                    final accountRecordReference =
                                        AccountRecord.collection.doc();
                                    await accountRecordReference
                                        .set(accountCreateData);
                                    accountRecord =
                                        AccountRecord.getDocumentFromData(
                                            accountCreateData,
                                            accountRecordReference);

                                    final usersUpdateData =
                                        createUsersRecordData(
                                      lastActiveAccountRef:
                                          accountRecord.reference,
                                    );
                                    await currentUserReference
                                        .update(usersUpdateData);

                                    final userAccountCreateData =
                                        createUserAccountRecordData(
                                      name: containerOnboardingRecord.name,
                                      displayName:
                                          containerOnboardingRecord.displayName,
                                      profileImagePath:
                                          containerOnboardingRecord
                                              .profileImagePath,
                                      relationship: 'guardian',
                                      accountRef: accountRecord.reference,
                                      state: 'active',
                                      createdAt: getCurrentTimestamp,
                                      updatedAt: getCurrentTimestamp,
                                      userRef: currentUserReference,
                                    );
                                    await UserAccountRecord.collection
                                        .doc()
                                        .set(userAccountCreateData);
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => KidsListWidget(),
                                      ),
                                      (r) => false,
                                    );

                                    setState(() {});
                                  },
                                  text: 'Lets Go!',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 55,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          lineHeight: 1,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.95, -0.95),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.close,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 20,
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OBGetStartedWidget(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ).animated([animationsMap['containerOnPageLoadAnimation']]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
