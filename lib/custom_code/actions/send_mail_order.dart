// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> sendMailOrder(
  String email,
  String htmlText,
  String temaMail,
) async {
  try {
    final response = await http.post(
      Uri.parse('https://rust.ff38.ru/functions/v1/send-mail'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'htmlText': htmlText,
        'temaMail': temaMail,
      }),
    );

    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
