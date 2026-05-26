import '../database.dart';

class GlobalTable extends SupabaseTable<GlobalRow> {
  @override
  String get tableName => 'global';

  @override
  GlobalRow createRow(Map<String, dynamic> data) => GlobalRow(data);
}

class GlobalRow extends SupabaseDataRow {
  GlobalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GlobalTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get androidVersion => getField<int>('androidVersion')!;
  set androidVersion(int value) => setField<int>('androidVersion', value);

  int? get numberOfQuestions => getField<int>('numberOfQuestions');
  set numberOfQuestions(int? value) =>
      setField<int>('numberOfQuestions', value);

  String? get prompt => getField<String>('prompt');
  set prompt(String? value) => setField<String>('prompt', value);

  int? get hoursOfLife => getField<int>('hoursOfLife');
  set hoursOfLife(int? value) => setField<int>('hoursOfLife', value);

  bool? get blocked => getField<bool>('blocked?');
  set blocked(bool? value) => setField<bool>('blocked?', value);

  String? get privacyPolicy => getField<String>('privacyPolicy');
  set privacyPolicy(String? value) => setField<String>('privacyPolicy', value);

  List<String> get admins => getListField<String>('admins');
  set admins(List<String>? value) => setListField<String>('admins', value);

  int? get iOSVersion => getField<int>('iOSVersion');
  set iOSVersion(int? value) => setField<int>('iOSVersion', value);

  int? get versionNumber => getField<int>('versionNumber');
  set versionNumber(int? value) => setField<int>('versionNumber', value);

  List<String> get forbiddenQuestions =>
      getListField<String>('forbiddenQuestions');
  set forbiddenQuestions(List<String>? value) =>
      setListField<String>('forbiddenQuestions', value);

  bool? get insertReceivedCode => getField<bool>('InsertReceivedCode');
  set insertReceivedCode(bool? value) =>
      setField<bool>('InsertReceivedCode', value);
}
