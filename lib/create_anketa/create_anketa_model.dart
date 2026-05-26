import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_anketa_widget.dart' show CreateAnketaWidget;
import 'package:flutter/material.dart';

class CreateAnketaModel extends FlutterFlowModel<CreateAnketaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for justthreewords1 widget.
  FocusNode? justthreewords1FocusNode;
  TextEditingController? justthreewords1TextController;
  String? Function(BuildContext, String?)?
      justthreewords1TextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AnketaSapRow>? povtor;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    justthreewords1FocusNode?.dispose();
    justthreewords1TextController?.dispose();
  }
}
