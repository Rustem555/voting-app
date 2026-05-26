import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  Local state fields for this page.

  int? searchItems = 0;

  String? newCall;

  ///  State fields for stateful widgets in this page.

  // State field(s) for newPassword widget.
  final newPasswordKey = GlobalKey();
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  String? newPasswordSelectedOption;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // Stores action output result for [Custom Action - changePasswordAction] action in Container widget.
  bool? passwordChangeReaction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newPasswordFocusNode?.dispose();
  }
}
