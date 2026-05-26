import '/flutter_flow/flutter_flow_util.dart';
import 'time_of_life_widget.dart' show TimeOfLifeWidget;
import 'package:flutter/material.dart';

class TimeOfLifeModel extends FlutterFlowModel<TimeOfLifeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
