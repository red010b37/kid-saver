import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../guardian_dashboard/guardian_dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KidsListWidget extends StatefulWidget {
  const KidsListWidget({Key key}) : super(key: key);

  @override
  _KidsListWidgetState createState() => _KidsListWidgetState();
}

class _KidsListWidgetState extends State<KidsListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final kidsListUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Who are you?',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 22,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [],
              elevation: 0,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<UserAccountRecord>>(
                    stream: queryUserAccountRecord(
                      queryBuilder: (userAccountRecord) => userAccountRecord
                          .where('account_ref',
                              isEqualTo:
                                  kidsListUsersRecord.lastActiveAccountRef)
                          .where('state', isEqualTo: 'active'),
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
                      List<UserAccountRecord> gridViewUserAccountRecordList =
                          snapshot.data;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewUserAccountRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewUserAccountRecord =
                              gridViewUserAccountRecordList[gridViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if ((gridViewUserAccountRecord
                                          .relationship) ==
                                      'guardian') {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GuardianDashboardWidget(
                                          userAccountRref:
                                              gridViewUserAccountRecord
                                                  .reference,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
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
                                            alignment:
                                                AlignmentDirectional(0, 0.1),
                                            child: Container(
                                              width: 80,
                                              height: 80,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                gridViewUserAccountRecord
                                                    .profileImagePath,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                gridViewUserAccountRecord.displayName,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          );
                        },
                      );
                    },
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
