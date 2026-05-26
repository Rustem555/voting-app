import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_panel_widget.dart' show AdminPanelWidget;
import 'package:flutter/material.dart';

class AdminPanelModel extends FlutterFlowModel<AdminPanelWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in adminPanel widget.
  List<AnketaSapRow>? readAnkets;
  Stream<List<AnketaSapRow>>? listViewSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
