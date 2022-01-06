import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../edit_profile_page/edit_profile_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import '../runner_sales/runner_sales_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RunnerVidWidget extends StatefulWidget {
  const RunnerVidWidget({Key key}) : super(key: key);

  @override
  _RunnerVidWidgetState createState() => _RunnerVidWidgetState();
}

class _RunnerVidWidgetState extends State<RunnerVidWidget> {
  String uploadedFileUrl = '';
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
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        final runnerVidUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Icon(
                              Icons.lock_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              runnerVidUsersRecord.username,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 2),
                            child: Container(
                              width: 28,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Color(0xFF930505),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '9+',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Icon(
                              Icons.menu_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 1),
                              child: Container(
                                width: 100,
                                height: 100,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.4, -0.02),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1, 0, 0, 0),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            runnerVidUsersRecord.profilePicUrl,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1, 1),
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1062AE),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '7',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lato',
                                          fontSize: 17,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 3, 0, 0),
                                        child: Text(
                                          'Posts',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lato',
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '179',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lato',
                                            fontSize: 17,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Text(
                                            'Followers',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '144',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lato',
                                          fontSize: 17,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 3, 0, 0),
                                        child: Text(
                                          'Followers',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lato',
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        runnerVidUsersRecord.displayName,
                                        textAlign: TextAlign.start,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lato',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 3, 0, 0),
                                        child: Text(
                                          runnerVidUsersRecord.bio,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lato',
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Color(0xFFF9F9F9),
                                size: 25,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RunnerSalesWidget(
                                      sales: '',
                                    ),
                                  ),
                                );
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.video_collection,
                                color: Color(0xFFF9F9F9),
                                size: 30,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'RunnerVid'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 18, 15, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilePageWidget(
                                  user: runnerVidUsersRecord,
                                ),
                              ),
                            );
                          },
                          text: 'Edit Profile',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 46,
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Color(0x77FFFFFF),
                              fontSize: 18,
                            ),
                            borderSide: BorderSide(
                              color: Color(0x8BF1F1F1),
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.grid_on,
                              color: Color(0xCBFFFFFF),
                              size: 28,
                            ),
                            Icon(
                              Icons.location_history_outlined,
                              color: Color(0x9AFFFFFF),
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord.where(
                              'username',
                              isEqualTo: runnerVidUsersRecord.username),
                          limit: 12,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            );
                          }
                          List<PostsRecord> gridViewPostsRecordList =
                              snapshot.data;
                          return InkWell(
                            onTap: () async {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                                allowVideo: true,
                                backgroundColor: Colors.black,
                                textColor: Color(0xFFF9F9F9),
                                pickerFontFamily: 'Playfair Display',
                              );
                              if (selectedMedia != null &&
                                  validateFileFormat(
                                      selectedMedia.storagePath, context)) {
                                showUploadMessage(context, 'Uploading file...',
                                    showLoading: true);
                                final downloadUrl = await uploadData(
                                    selectedMedia.storagePath,
                                    selectedMedia.bytes);
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrl != null) {
                                  setState(() => uploadedFileUrl = downloadUrl);
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  showUploadMessage(
                                      context, 'Failed to upload media');
                                  return;
                                }
                              }
                            },
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                childAspectRatio: 1,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewPostsRecordList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewPostsRecord =
                                    gridViewPostsRecordList[gridViewIndex];
                                return Stack(
                                  children: [
                                    Image.network(
                                      runnerVidUsersRecord.profilePicUrl,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.85, -0.85),
                                      child: Icon(
                                        Icons.content_copy,
                                        color: Color(0xD8FFFFFF),
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
