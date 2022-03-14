import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../kids_list/kids_list_widget.dart';
import '../o_b_get_started/o_b_get_started_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OBEmailPasswordWidget extends StatefulWidget {
  const OBEmailPasswordWidget({
    Key key,
    this.onboardingRef,
  }) : super(key: key);

  final DocumentReference onboardingRef;

  @override
  _OBEmailPasswordWidgetState createState() => _OBEmailPasswordWidgetState();
}

class _OBEmailPasswordWidgetState extends State<OBEmailPasswordWidget>
    with TickerProviderStateMixin {
  AccountRecord accountRecord;
  TextEditingController emailTFController;
  TextEditingController passwordTextFieldController;
  bool passwordTextFieldVisibility;
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

    emailTFController = TextEditingController();
    passwordTextFieldController = TextEditingController(text: 'Enter Password');
    passwordTextFieldVisibility = false;
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
                    height: 380,
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
                                  'Login  Details',
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
                                'Enter email and password so you can log back in.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  controller: emailTFController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Email  address',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
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
                                            .tertiaryColor,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  controller: passwordTextFieldController,
                                  obscureText: !passwordTextFieldVisibility,
                                  decoration: InputDecoration(
                                    hintText: ' Mum, Dad, something else ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordTextFieldVisibility =
                                            !passwordTextFieldVisibility,
                                      ),
                                      child: Icon(
                                        passwordTextFieldVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final user = await createAccountWithEmail(
                                      context,
                                      emailTFController.text,
                                      passwordTextFieldController.text,
                                    );
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
                                    var accountRecordReference =
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
                                  text: 'Lets GO!',
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
