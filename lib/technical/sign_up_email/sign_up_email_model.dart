import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_email_widget.dart' show SignUpEmailWidget;
import 'package:flutter/material.dart';

class SignUpEmailModel extends FlutterFlowModel<SignUpEmailWidget> {
  ///  Local state fields for this page.

  int? searchItems = 0;

  String? newCall;

  ///  State fields for stateful widgets in this page.

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
  // State field(s) for PasswordConfirm widget.
  final passwordConfirmKey = GlobalKey();
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  String? passwordConfirmSelectedOption;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordConfirmVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();

    passwordFocusNode?.dispose();

    passwordConfirmFocusNode?.dispose();
  }
}
