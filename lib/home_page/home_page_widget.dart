import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_widget.dart';
import '/components/survey_result_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'homePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (functions.onlyDate(FFAppState().checkData) !=
          functions.onlyDate(getCurrentTimestamp)) {
        await AnketaSapTable().delete(
          matchingRows: (rows) => rows.ltOrNull(
            'deadLine',
            supaSerialize<DateTime>(getCurrentTimestamp),
          ),
        );
        FFAppState().checkData = getCurrentTimestamp;
        safeSetState(() {});
      }
      _model.readVersionAndBlock = await GlobalTable().queryRows(
        queryFn: (q) => q,
      );
      if (_model.readVersionAndBlock!.firstOrNull!.blocked!) {
        context.goNamed(BlockedScreenWidget.routeName);

        return;
      } else {
        if (isAndroid) {
          if (_model.readVersionAndBlock?.firstOrNull?.androidVersion == 27) {
            _model.readAnkets1 = await AnketaSapTable().queryRows(
              queryFn: (q) => q,
            );
            FFAppState().arrayAnket = functions
                .sorting(_model.readAnkets1?.toList(), currentUserEmail)!
                .toList()
                .cast<BazaAnketStruct>();
            safeSetState(() {});
            return;
          } else {
            context.pushNamed(UpdateScreenWidget.routeName);

            return;
          }
        } else {
          if (isiOS) {
            if (_model.readVersionAndBlock?.firstOrNull?.iOSVersion == 27) {
              _model.readAnkets2 = await AnketaSapTable().queryRows(
                queryFn: (q) => q,
              );
              FFAppState().arrayAnket = functions
                  .sorting(_model.readAnkets2?.toList(), currentUserEmail)!
                  .toList()
                  .cast<BazaAnketStruct>();
              safeSetState(() {});
              return;
            } else {
              context.pushNamed(UpdateScreenWidget.routeName);

              return;
            }
          } else {
            _model.readAnkets = await AnketaSapTable().queryRows(
              queryFn: (q) => q,
            );
            FFAppState().arrayAnket = functions
                .sorting(_model.readAnkets?.toList(), currentUserEmail)!
                .toList()
                .cast<BazaAnketStruct>();
            safeSetState(() {});
            return;
          }
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<AnketaSapRow>>(
      future: AnketaSapTable().queryRows(
        queryFn: (q) => q,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<AnketaSapRow> homePageAnketaSapRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).success,
                automaticallyImplyLeading: false,
                title: Text(
                  'Доступные опросы',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.outfit(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 25.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 55.0),
                  child: Builder(
                    builder: (context) {
                      final array = FFAppState().arrayAnket.toList();
                      if (array.isEmpty) {
                        return Center(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 150.0,
                            child: EmptyWidget(),
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: array.length,
                        itemBuilder: (context, arrayIndex) {
                          final arrayItem = array[arrayIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (arrayItem.usersWhoResponded
                                      .contains(currentUserEmail) ==
                                  true) {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          child: SurveyResultWidget(
                                            answers: arrayItem.answers,
                                            questionType:
                                                arrayItem.questionType,
                                            var1: arrayItem.var1,
                                            var2: arrayItem.var2,
                                            questionText:
                                                arrayItem.textQuestion,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                return;
                              } else {
                                FFAppState().permission = true;
                                safeSetState(() {});
                              }

                              context.pushNamed(
                                QuestionWidget.routeName,
                                queryParameters: {
                                  'idAnketa': serializeParam(
                                    arrayItem.uuid,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: (arrayItem.usersWhoResponded
                                                        .contains(
                                                            currentUserEmail) ==
                                                    true) ==
                                                false
                                            ? Color(0xFFAEE254)
                                            : Color(0xFF2F7F76),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 0.0, 16.0),
                                          child: Text(
                                            arrayItem.textQuestion,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (arrayItem.usersWhoResponded
                                          .contains(currentUserEmail) ==
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Text(
                                        'Ответили: ${arrayItem.answers.length.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
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
