import '../database.dart';

class UsersSemTable extends SupabaseTable<UsersSemRow> {
  @override
  String get tableName => 'usersSem';

  @override
  UsersSemRow createRow(Map<String, dynamic> data) => UsersSemRow(data);
}

class UsersSemRow extends SupabaseDataRow {
  UsersSemRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersSemTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get nickname => getField<String>('nickname');
  set nickname(String? value) => setField<String>('nickname', value);
}
