import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_pass_page_widget.dart' show ForgotPassPageWidget;
import 'package:flutter/material.dart';

class ForgotPassPageModel extends FlutterFlowModel<ForgotPassPageWidget> {
  ///  Local state fields for this page.

  String? temporaryPassword;

  ///  State fields for stateful widgets in this page.

  // State field(s) for newPassword widget.
  final newPasswordKey = GlobalKey();
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  String? newPasswordSelectedOption;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // Stores action output result for [Custom Action - resetPassword] action in Container widget.
  bool? resetPass;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newPasswordFocusNode?.dispose();
  }
}
