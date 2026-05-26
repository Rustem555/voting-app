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

Future<bool> changePasswordAction(
  BuildContext context,
  String newPassword,
) async {
  try {
    // 1. Получаем текущего пользователя
    final currentUser = SupaFlow.client.auth.currentUser;
    if (currentUser == null) {
      throw Exception('Пользователь не авторизован');
    }

    // 2. Используем встроенный метод Supabase
    final response = await SupaFlow.client.functions.invoke(
      'change-password',
      body: {
        'new_password': newPassword,
      },
    );

    // 3. Обработка ответа
    if (response.status == 200) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пароль успешно изменён!')),
        );
      }
      return true;
    } else {
      final error = response.data['error'] ?? 'Unknown error';
      throw Exception(error);
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: ${e.toString()}')),
      );
    }
    return false;
  }
}
