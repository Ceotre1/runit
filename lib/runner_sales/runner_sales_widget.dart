import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RunnerSalesWidget extends StatefulWidget {
  const RunnerSalesWidget({
    Key key,
    this.sales,
  }) : super(key: key);

  final String sales;

  @override
  _RunnerSalesWidgetState createState() => _RunnerSalesWidgetState();
}

class _RunnerSalesWidgetState extends State<RunnerSalesWidget> {
  String dropDownValue;
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PostsRecord>>(
      stream: queryPostsRecord(),
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
        List<PostsRecord> runnerSalesPostsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Color(0xFF95A1AC),
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NavBarPage(initialPage: 'ProfilePage'),
                  ),
                );
              },
            ),
            title: Text(
              'Back to Products',
              style: FlutterFlowTheme.bodyText2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF8B97A2),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Color(0xFF262D34),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.94,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x3E000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                              allowVideo: true,
                              backgroundColor: Colors.black,
                              pickerFontFamily: 'Libre Caslon Display',
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://d010204.bibloo.cz/_galerie/varianty/96/969946-z.jpg',
                              width: MediaQuery.of(context).size.width * 0.96,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Product Name',
                          style: FlutterFlowTheme.title3.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Multi-Color Jacket',
                        style: FlutterFlowTheme.bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF8B97A2),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '\$125.00',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFFF9F9F9),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Sporty style from the archives inspires this iconic track top. A stand-up collar and the signature sheen of tricot give it a retro vibe. Made for relaxing between sessions, the full-zip jacket has a recycled polyester build.',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 40),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowDropDown(
                        options: ['Quanity', '1', '2', '3', '4'].toList(),
                        onChanged: (val) => setState(() => dropDownValue = val),
                        width: 120,
                        height: 50,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF95A1AC),
                          size: 15,
                        ),
                        fillColor: Color(0xFF090F13),
                        elevation: 3,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 8,
                        margin: EdgeInsetsDirectional.fromSTEB(20, 4, 8, 4),
                        hidesUnderline: true,
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Buy Now',
                        options: FFButtonOptions(
                          width: 170,
                          height: 50,
                          color: Colors.black,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
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
