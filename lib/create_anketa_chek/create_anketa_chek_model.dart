import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_anketa_chek_widget.dart' show CreateAnketaChekWidget;
import 'package:flutter/material.dart';

class CreateAnketaChekModel extends FlutterFlowModel<CreateAnketaChekWidget> {
  ///  Local state fields for this page.

  bool trueOrFalse = false;

  String? answerApi;

  String? decoder;

  int? questionYype;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<GlobalRow>? readGlobal;
  // Stores action output result for [Backend Call - API (DeepSeekX)] action in Button widget.
  ApiCallResponse? apiResultb0e1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
