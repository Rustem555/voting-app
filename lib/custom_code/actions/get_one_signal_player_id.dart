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

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<String?> getOneSignalPlayerId() async {
  // Инициализация OneSignal (замените 'YOUR_ONESIGNAL_APP_ID' на реальный App ID)
  OneSignal.initialize('47f99a37-1ebd-4e9c-b835-149e64c50ae3');

  // Настройка запроса разрешений (опционально)
  OneSignal.Notifications.requestPermission(true);

  // Получаем Player ID
  final pushSubscription = await OneSignal.User.pushSubscription;

  if (pushSubscription.id != null) {
    print("OneSignal Player ID: ${pushSubscription.id}");
    return pushSubscription.id;
  } else {
    print("OneSignal Player ID not available (user denied permissions?)");
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
