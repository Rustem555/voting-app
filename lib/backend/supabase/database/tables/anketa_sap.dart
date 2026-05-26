import '../database.dart';

class AnketaSapTable extends SupabaseTable<AnketaSapRow> {
  @override
  String get tableName => 'anketaSap';

  @override
  AnketaSapRow createRow(Map<String, dynamic> data) => AnketaSapRow(data);
}

class AnketaSapRow extends SupabaseDataRow {
  AnketaSapRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnketaSapTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  String? get author => getField<String>('author');
  set author(String? value) => setField<String>('author', value);

  List<String> get usersWhoResponded =>
      getListField<String>('usersWhoResponded');
  set usersWhoResponded(List<String>? value) =>
      setListField<String>('usersWhoResponded', value);

  List<int> get answers => getListField<int>('answers');
  set answers(List<int>? value) => setListField<int>('answers', value);

  String? get textQuestion => getField<String>('textQuestion');
  set textQuestion(String? value) => setField<String>('textQuestion', value);

  DateTime? get deadLine => getField<DateTime>('deadLine');
  set deadLine(DateTime? value) => setField<DateTime>('deadLine', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get questionType => getField<int>('questionType');
  set questionType(int? value) => setField<int>('questionType', value);

  String? get var1 => getField<String>('var1');
  set var1(String? value) => setField<String>('var1', value);

  String? get var2 => getField<String>('var2');
  set var2(String? value) => setField<String>('var2', value);

  DateTime? get timeOfLastVote => getField<DateTime>('timeOfLastVote');
  set timeOfLastVote(DateTime? value) =>
      setField<DateTime>('timeOfLastVote', value);
}
