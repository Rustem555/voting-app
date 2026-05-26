import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_email_widget.dart' show LoginEmailWidget;
import 'package:flutter/material.dart';

class LoginEmailModel extends FlutterFlowModel<LoginEmailWidget> {
  ///  Local state fields for this page.

  int? searchItems = 0;

  String? newCall;

  ///  State fields for stateful widgets in this page.

  bool vera = false;
  // State field(s) for EmailAddress widget.
  final emailAddressKey = GlobalKey();
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? emailAddressSelectedOption;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for Password widget.
  final passwordKey = GlobalKey();
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  String? passwordSelectedOption;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();

    passwordFocusNode?.dispose();
  }
}
