import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/answer_first_widget.dart';
import '/components/moderation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_anketa_chek_model.dart';
export 'create_anketa_chek_model.dart';

class CreateAnketaChekWidget extends StatefulWidget {
  const CreateAnketaChekWidget({super.key});

  static String routeName = 'createAnketaChek';
  static String routePath = '/createAnketaChek';

  @override
  State<CreateAnketaChekWidget> createState() => _CreateAnketaChekWidgetState();
}

class _CreateAnketaChekWidgetState extends State<CreateAnketaChekWidget> {
  late CreateAnketaChekModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAnketaChekModel());

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).success,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<GlobalRow>>(
            future: GlobalTable().querySingleRow(
              queryFn: (q) => q,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<GlobalRow> containerGlobalRowList = snapshot.data!;

              final containerGlobalRow = containerGlobalRowList.isNotEmpty
                  ? containerGlobalRowList.first
                  : null;

              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Text(
                          'Вопрос:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Text(
                          FFAppState().createAnketa.textQuestion,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      if (_model.trueOrFalse)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 70.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.readGlobal = await GlobalTable().queryRows(
                                queryFn: (q) => q,
                              );
                              _model.questionYype = functions.generator1(
                                  FFAppState().createAnketa.textQuestion);
                              safeSetState(() {});
                              await AnketaSapTable().insert({
                                'created_at': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                                'uuid': FFAppState().createAnketa.uuid,
                                'author': currentUserEmail,
                                'textQuestion':
                                    FFAppState().createAnketa.textQuestion,
                                'deadLine': supaSerialize<DateTime>(
                                    functions.deadLine(_model
                                        .readGlobal?.firstOrNull?.hoursOfLife)),
                                'questionType': _model.questionYype,
                                'var1': functions.generator2(
                                    FFAppState().createAnketa.textQuestion),
                                'var2': functions.generator3(
                                    FFAppState().createAnketa.textQuestion),
                              });
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.3,
                                        child: AnswerFirstWidget(
                                          idQuestion:
                                              FFAppState().createAnketa.uuid,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              safeSetState(() {});
                            },
                            text: 'Опубликовать',
                            options: FFButtonOptions(
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      if (!_model.trueOrFalse)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 70.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.apiResultb0e1 = await DeepSeekXCall.call(
                                promptJson: functions.createPrompt(
                                    FFAppState().createAnketa.textQuestion,
                                    containerGlobalRow?.prompt),
                              );

                              if ((_model.apiResultb0e1?.succeeded ?? true)) {
                                _model.answerApi = getJsonField(
                                  (_model.apiResultb0e1?.jsonBody ?? ''),
                                  r'''$.choices[0].message.content''',
                                ).toString();
                                safeSetState(() {});
                                _model.decoder =
                                    functions.decoder(_model.answerApi);
                                safeSetState(() {});
                                if (_model.decoder == 'true') {
                                  _model.trueOrFalse = true;
                                  safeSetState(() {});
                                } else {
                                  await GlobalTable().update(
                                    data: {
                                      'forbiddenQuestions': functions.plusUser(
                                          containerGlobalRow?.forbiddenQuestions
                                              .toList(),
                                          FFAppState()
                                              .createAnketa
                                              .textQuestion),
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id',
                                      1,
                                    ),
                                  );
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
                                                0.4,
                                            child: ModerationWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                              }

                              safeSetState(() {});
                            },
                            text: 'Далее',
                            options: FFButtonOptions(
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
