// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateAnketaStruct extends BaseStruct {
  CreateAnketaStruct({
    String? author,
    String? description,
    String? uuid,
    String? textQuestion,
  })  : _author = author,
        _description = description,
        _uuid = uuid,
        _textQuestion = textQuestion;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;

  bool hasUuid() => _uuid != null;

  // "textQuestion" field.
  String? _textQuestion;
  String get textQuestion => _textQuestion ?? '';
  set textQuestion(String? val) => _textQuestion = val;

  bool hasTextQuestion() => _textQuestion != null;

  static CreateAnketaStruct fromMap(Map<String, dynamic> data) =>
      CreateAnketaStruct(
        author: data['author'] as String?,
        description: data['description'] as String?,
        uuid: data['uuid'] as String?,
        textQuestion: data['textQuestion'] as String?,
      );

  static CreateAnketaStruct? maybeFromMap(dynamic data) => data is Map
      ? CreateAnketaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'author': _author,
        'description': _description,
        'uuid': _uuid,
        'textQuestion': _textQuestion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'textQuestion': serializeParam(
          _textQuestion,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreateAnketaStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreateAnketaStruct(
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        textQuestion: deserializeParam(
          data['textQuestion'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreateAnketaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreateAnketaStruct &&
        author == other.author &&
        description == other.description &&
        uuid == other.uuid &&
        textQuestion == other.textQuestion;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([author, description, uuid, textQuestion]);
}

CreateAnketaStruct createCreateAnketaStruct({
  String? author,
  String? description,
  String? uuid,
  String? textQuestion,
}) =>
    CreateAnketaStruct(
      author: author,
      description: description,
      uuid: uuid,
      textQuestion: textQuestion,
    );
