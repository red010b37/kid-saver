import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAvatarSelectorWidget extends StatefulWidget {
  const UserAvatarSelectorWidget({
    Key key,
    this.userAccountRef,
  }) : super(key: key);

  final DocumentReference userAccountRef;

  @override
  _UserAvatarSelectorWidgetState createState() =>
      _UserAvatarSelectorWidgetState();
}

class _UserAvatarSelectorWidgetState extends State<UserAvatarSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 30),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              's7csthov' /* Select One */,
                            ),
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.white,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 50,
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<AvatarsRecord>>(
                      stream: queryAvatarsRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<AvatarsRecord> wrapAvatarsRecordList =
                            snapshot.data;
                        return Wrap(
                          spacing: 30,
                          runSpacing: 30,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: List.generate(wrapAvatarsRecordList.length,
                              (wrapIndex) {
                            final wrapAvatarsRecord =
                                wrapAvatarsRecordList[wrapIndex];
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/select_screen_circles.png',
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0.1),
                                        child: InkWell(
                                          onTap: () async {
                                            final userAccountUpdateData =
                                                createUserAccountRecordData(
                                              profileImagePath:
                                                  wrapAvatarsRecord.path,
                                              updatedAt: getCurrentTimestamp,
                                            );
                                            await widget.userAccountRef
                                                .update(userAccountUpdateData);
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: wrapAvatarsRecord.path,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
