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

Future<void> deleteUserAction(
  BuildContext context,
  String userId,
) async {
  try {
    // URL вашей Edge Function в Supabase
    const edgeFunctionUrl = 'https://rust.ff38.ru/functions/v1/delete-user';

    // Получаем Supabase JWT из текущей сессии
    // (этот код может отличаться в зависимости от вашей реализации аутентификации)
    final session = Supabase.instance.client.auth.currentSession;
    final accessToken = session?.accessToken;

    if (accessToken == null) {
      throw Exception('User not authenticated');
    }

    // Отправляем запрос к Edge Function
    final response = await http.post(
      Uri.parse(edgeFunctionUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'user_id': userId,
      }),
    );

    if (response.statusCode == 200) {
      // Успешное удаление
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User deleted successfully')),
      );
    } else {
      // Ошибка
      throw Exception('Failed to delete user: ${response.body}');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error deleting user: $e')),
    );
    rethrow;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
