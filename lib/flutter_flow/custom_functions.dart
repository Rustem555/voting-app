import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<int>? plusAnswer(
  List<int>? array,
  int plusInt,
) {
  // Это очень сложная задача. Никто из моделей искусственного интелекта не смог мне помочь. добавь plusItem в array.  число элементов array при этом должно увеличиться на единицу. добавь plusItem независимо от значения. До сих пор предлагаемые коды работают с ошибкой, Если [1, 1, 1] добавить (0), возвращает [1,1,1,0], это верно. Если [1, 1, 1] добавить (1), возвращает [1,1,1], то есть один компонент массива теряется и не добавляется
// добавляем plusInt в массив array независимо от значения
  if (array == null) {
    array = [];
  }
  array.add(plusInt);
  return array;
}

List<String>? plusUser(
  List<String>? array,
  String? user,
) {
  // верни array с добавленным user
  if (array == null) {
    array = [];
  }
  if (user != null && !array.contains(user)) {
    array.add(user);
  }
  return array;
}

dynamic createPrompt(
  String? prompt,
  String? promptSupa,
) {
  // преобразуй входящую строку "prompt" в  [{"role":"user", "content": "promptSupa" " Hello man" "верни только одно слово"}] типа JSON
  if (prompt == null || promptSupa == null) return null;
  return [
    {"role": "user", "content": "$promptSupa $prompt"}
  ];
}

String? decoder(String? input) {
  // переведи недекодированные Unicode-символы в кодировку UTF-8
  if (input == null) return null;
  return utf8.decode(input.runes.toList());
}

String? questionMarkCapital(String? input) {
  // Проверь, есть ли в конце входящей строки вопросительный знак. Если нет - добавь или замени им  иные знаки препинания. Проверь, с заглавной ли буквы начинается предложение. Если начинается со строчной - замени на заглавную
  if (input == null) return null;
  if (!input.endsWith('?')) {
    input = input.replaceAll(RegExp(r'[.,!?]$'), '') + '?';
  }
  if (input.isNotEmpty && input[0] != input[0].toUpperCase()) {
    input = input[0].toUpperCase() + input.substring(1);
  }
  return input;
}

int? percentageYes(List<int>? array) {
  // вычисли, какую долю составляет число "0"  в array и верни в процентах с округлением до целых
  if (array == null || array.isEmpty) return null;
  int countZero = array.where((element) => element == 0).length;
  return ((countZero / array.length) * 100).round();
}

DateTime? deadLine(int? hoursOfLife) {
  // Прибавь к currentTime количество часов равному hoursOfLife и верни новую дату
  if (hoursOfLife == null) return null;
  final currentTime = DateTime.now();
  return currentTime.add(Duration(hours: hoursOfLife));
}

List<BazaAnketStruct>? sorting(
  List<AnketaSapRow>? anketaSap,
  String? myEmail,
) {
  // Из входящего списка строк Supabase сформируй массив datatype BazaAnket. Соответствующие поля перенеси. Отсортируй так: сначала сроки Supabase, в которых поле usersWhoResponded не содержит myEmal, отсортированные по количеству элементов поля answers по убыванию. Затем сроки Supabase, в которых поле usersWhoResponded содержит myEmal, отсортированные по количеству элементов поля answers по убыванию.
  if (anketaSap == null) return null;

  List<BazaAnketStruct> notResponded = [];
  List<BazaAnketStruct> responded = [];

  for (var row in anketaSap) {
    var bazaan = BazaAnketStruct(
      id: row.id,
      createdAt: row.createdAt,
      deadLine: row.deadLine,
      uuid: row.uuid,
      author: row.author,
      textQuestion: row.textQuestion,
      usersWhoResponded: row.usersWhoResponded,
      answers: row.answers,
      questionType: row.questionType,
      var1: row.var1,
      var2: row.var2,
    );

    if (row.usersWhoResponded?.contains(myEmail) == true) {
      responded.add(bazaan);
    } else {
      notResponded.add(bazaan);
    }
  }

  notResponded.sort((a, b) => b.answers.length.compareTo(a.answers.length));
  responded.sort((a, b) => b.answers.length.compareTo(a.answers.length));

  return [...notResponded, ...responded];
}

bool? justFiveWords(String? inputString) {
  // Верни false, если во входящем предложении более пяти слов. Иначе верни true
  if (inputString == null) return null;

  // Удаляем тире и другие нежелательные символы, затем разбиваем на слова
  String cleanedString = inputString.replaceAll(RegExp(r'[-–—]'), ' ');

  // Разбиваем на слова, фильтруем пустые строки
  List<String> words =
      cleanedString.split(' ').where((word) => word.isNotEmpty).toList();

  return words.length <= 5;
}

String? onlyDate(DateTime? date) {
  // Верни дату в формате 11.06.2025
  if (date == null) return null;
  return DateFormat('dd.MM.yyyy').format(date);
}

String reversestring(String input) {
  String reversed = '';
  for (int i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}

int? stringToInt(String? input) {
  // from an input string of the form 9172680005 return an integer of the form 79172680005
  if (input == null) {
    return null;
  }
  // Remove any non-numeric characters from the input string
  String numericString = input.replaceAll(RegExp(r'\D'), '');
  // Add '7' at the beginning of the numeric string
  String resultString = '7$numericString';
  // Parse the result string to an integer
  int result = int.tryParse(resultString) ?? 0;
  return result;
}

String? stringToString(String? phone) {
  // переведи строку вида (917) 268-0005 в строку вида 9172680005
  if (phone == null) return null;
  return phone.replaceAll(RegExp(r'\D'), '');
}

int? isCallablePhone(String? phoneNumber) {
  /// Проверяет валидность телефонного номера для совершения звонка
  /// Возвращает:
  /// 1 - номер валиден (содержит код страны)
  /// 0 - номер невалиден
  int? isCallablePhone(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 0;
    }

    // Удаляем все нецифровые символы, кроме плюса
    final cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

    // Проверяем следующие условия:
    // 1. Номер начинается с + и содержит от 8 до 15 цифр
    // 2. ИЛИ номер содержит ровно 11 цифр (для российских номеров без +7)
    final regex = RegExp(r'^(?:\+[1-9]\d{7,14}|[1-9]\d{10})$');

    // Дополнительная проверка минимальной длины
    final digitsOnly = cleanedNumber.replaceAll('+', '');
    if (digitsOnly.length < 10) {
      return 0;
    }

    return regex.hasMatch(cleanedNumber) ? 1 : 0;
  }
}

int? generator1(String? question) {
  // Верни "1" если строка содержит " или ", обрамленный пробелами,  иначе верни "0"
  if (question != null && question.contains(' или ')) {
    return 1;
  }
  return 0;
}

String? generator2(String? question) {
  // Верни часть строки до пробела и последующего  слова "или"
  if (question == null) return null;
  int index = question.indexOf(' или');
  return index != -1 ? question.substring(0, index) : question;
}

String? generator3(String? question) {
  // верни часть строки после слова "или " с последующим пробелом, с заглавной буквы и без вопросительного знака в конце
  if (question == null) return null;
  final parts = question.split('или ');
  if (parts.length < 2) return null;
  String result = parts[1].trim();
  if (result.endsWith('?')) {
    result = result.substring(0, result.length - 1);
  }
  return result[0].toUpperCase() + result.substring(1);
}

String? phoneOrEmail(String? psevdoEmail) {
  // Дай код вида String phoneOrEmail(String psevdoEmail) {   RegExp phonePattern = RegExp(r'^(\+\d{11})@');   Match? match = phonePattern.firstMatch(psevdoEmail);      if (match != null) {          return match.group(1)!;   }      // Во всех остальных случаях возвращаем исходную строку   return psevdoEmail; }
  RegExp phonePattern = RegExp(r'^(\+\d{11})@');
  Match? match = phonePattern.firstMatch(psevdoEmail ?? '');

  if (match != null) {
    return match.group(1);
  }

  return psevdoEmail;
}

String? phoneOrEmailPass(String? psevdoEmail) {
  // если входящая строка имеет вид +79172680005@mail.ru независимо от цифр - верни 'phone', иначе верни 'email'
  final RegExp phonePattern = RegExp(r'^\+\d{11}@mail\.ru$');
  return phonePattern.hasMatch(psevdoEmail ?? '') ? 'phone' : 'email';
}

String? vremjaProstoya(DateTime? timeOfLastVote) {
  // Вычисли разницу между timeOfLastVote и currentTime. прибавь  три часа. результат верни ввиде строки в часах и минутах. Если timeOfLastVote пустой или NULL  верни "не определено
  if (timeOfLastVote == null) {
    return "не определено";
  }
  final currentTime = DateTime.now();
  final difference = currentTime.difference(timeOfLastVote).inMinutes +
      180; // прибавляем 3 часа в минутах
  final hours = difference ~/ 60;
  final minutes = difference % 60;
  return '$hours ч $minutes мин';
}

bool? formatCheck(String? input) {
  // Верни true, если input является integer от 1 до 48, иначе верни False
  if (input == null) return false; // Check if input is null
  final intValue = int.tryParse(input); // Try to parse the input as an integer
  return intValue != null &&
      intValue >= 1 &&
      intValue <= 48; // Check if it's between 1 and 48
}

int? numberofauthors(List<AnketaSapRow>? table) {
  // Защита от null: если таблица не передана, возвращаем null
  if (table == null) return null;

  // Защита от пустого списка
  if (table.isEmpty) return 0;

  // Создаем Set для хранения уникальных авторов
  // Set автоматически удаляет дубликаты
  final uniqueAuthors = <String>{};

  // Проходим по всем строкам таблицы
  for (final row in table) {
    // Добавляем автора в Set (дубликаты игнорируются)
    if (row.author != null && row.author!.isNotEmpty) {
      uniqueAuthors.add(row.author!);
    }
  }

  // Возвращаем количество уникальных авторов
  return uniqueAuthors.length;
}
