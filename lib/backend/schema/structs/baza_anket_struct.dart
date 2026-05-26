// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BazaAnketStruct extends BaseStruct {
  BazaAnketStruct({
    int? id,
    DateTime? createdAt,
    DateTime? deadLine,
    String? uuid,
    List<String>? usersWhoResponded,
    String? author,
    List<int>? answers,
    String? textQuestion,
    int? questionType,
    String? var1,
    String? var2,
  })  : _id = id,
        _createdAt = createdAt,
        _deadLine = deadLine,
        _uuid = uuid,
        _usersWhoResponded = usersWhoResponded,
        _author = author,
        _answers = answers,
        _textQuestion = textQuestion,
        _questionType = questionType,
        _var1 = var1,
        _var2 = var2;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "deadLine" field.
  DateTime? _deadLine;
  DateTime? get deadLine => _deadLine;
  set deadLine(DateTime? val) => _deadLine = val;

  bool hasDeadLine() => _deadLine != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;

  bool hasUuid() => _uuid != null;

  // "usersWhoResponded" field.
  List<String>? _usersWhoResponded;
  List<String> get usersWhoResponded => _usersWhoResponded ?? const [];
  set usersWhoResponded(List<String>? val) => _usersWhoResponded = val;

  void updateUsersWhoResponded(Function(List<String>) updateFn) {
    updateFn(_usersWhoResponded ??= []);
  }

  bool hasUsersWhoResponded() => _usersWhoResponded != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "answers" field.
  List<int>? _answers;
  List<int> get answers => _answers ?? const [];
  set answers(List<int>? val) => _answers = val;

  void updateAnswers(Function(List<int>) updateFn) {
    updateFn(_answers ??= []);
  }

  bool hasAnswers() => _answers != null;

  // "textQuestion" field.
  String? _textQuestion;
  String get textQuestion => _textQuestion ?? '';
  set textQuestion(String? val) => _textQuestion = val;

  bool hasTextQuestion() => _textQuestion != null;

  // "questionType" field.
  int? _questionType;
  int get questionType => _questionType ?? 0;
  set questionType(int? val) => _questionType = val;

  void incrementQuestionType(int amount) =>
      questionType = questionType + amount;

  bool hasQuestionType() => _questionType != null;

  // "var1" field.
  String? _var1;
  String get var1 => _var1 ?? '';
  set var1(String? val) => _var1 = val;

  bool hasVar1() => _var1 != null;

  // "var2" field.
  String? _var2;
  String get var2 => _var2 ?? '';
  set var2(String? val) => _var2 = val;

  bool hasVar2() => _var2 != null;

  static BazaAnketStruct fromMap(Map<String, dynamic> data) => BazaAnketStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as DateTime?,
        deadLine: data['deadLine'] as DateTime?,
        uuid: data['uuid'] as String?,
        usersWhoResponded: getDataList(data['usersWhoResponded']),
        author: data['author'] as String?,
        answers: getDataList(data['answers']),
        textQuestion: data['textQuestion'] as String?,
        questionType: castToType<int>(data['questionType']),
        var1: data['var1'] as String?,
        var2: data['var2'] as String?,
      );

  static BazaAnketStruct? maybeFromMap(dynamic data) => data is Map
      ? BazaAnketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'deadLine': _deadLine,
        'uuid': _uuid,
        'usersWhoResponded': _usersWhoResponded,
        'author': _author,
        'answers': _answers,
        'textQuestion': _textQuestion,
        'questionType': _questionType,
        'var1': _var1,
        'var2': _var2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'deadLine': serializeParam(
          _deadLine,
          ParamType.DateTime,
        ),
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'usersWhoResponded': serializeParam(
          _usersWhoResponded,
          ParamType.String,
          isList: true,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'answers': serializeParam(
          _answers,
          ParamType.int,
          isList: true,
        ),
        'textQuestion': serializeParam(
          _textQuestion,
          ParamType.String,
        ),
        'questionType': serializeParam(
          _questionType,
          ParamType.int,
        ),
        'var1': serializeParam(
          _var1,
          ParamType.String,
        ),
        'var2': serializeParam(
          _var2,
          ParamType.String,
        ),
      }.withoutNulls;

  static BazaAnketStruct fromSerializableMap(Map<String, dynamic> data) =>
      BazaAnketStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        deadLine: deserializeParam(
          data['deadLine'],
          ParamType.DateTime,
          false,
        ),
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        usersWhoResponded: deserializeParam<String>(
          data['usersWhoResponded'],
          ParamType.String,
          true,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        answers: deserializeParam<int>(
          data['answers'],
          ParamType.int,
          true,
        ),
        textQuestion: deserializeParam(
          data['textQuestion'],
          ParamType.String,
          false,
        ),
        questionType: deserializeParam(
          data['questionType'],
          ParamType.int,
          false,
        ),
        var1: deserializeParam(
          data['var1'],
          ParamType.String,
          false,
        ),
        var2: deserializeParam(
          data['var2'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BazaAnketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BazaAnketStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        deadLine == other.deadLine &&
        uuid == other.uuid &&
        listEquality.equals(usersWhoResponded, other.usersWhoResponded) &&
        author == other.author &&
        listEquality.equals(answers, other.answers) &&
        textQuestion == other.textQuestion &&
        questionType == other.questionType &&
        var1 == other.var1 &&
        var2 == other.var2;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        deadLine,
        uuid,
        usersWhoResponded,
        author,
        answers,
        textQuestion,
        questionType,
        var1,
        var2
      ]);
}

BazaAnketStruct createBazaAnketStruct({
  int? id,
  DateTime? createdAt,
  DateTime? deadLine,
  String? uuid,
  String? author,
  String? textQuestion,
  int? questionType,
  String? var1,
  String? var2,
}) =>
    BazaAnketStruct(
      id: id,
      createdAt: createdAt,
      deadLine: deadLine,
      uuid: uuid,
      author: author,
      textQuestion: textQuestion,
      questionType: questionType,
      var1: var1,
      var2: var2,
    );
