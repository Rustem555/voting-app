import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Delete Row(s)] action in homePage widget.
  List<AnketaSapRow>? readDL;
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<GlobalRow>? readVersionAndBlock;
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<AnketaSapRow>? readAnkets1;
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<AnketaSapRow>? readAnkets2;
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<AnketaSapRow>? readAnkets;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
