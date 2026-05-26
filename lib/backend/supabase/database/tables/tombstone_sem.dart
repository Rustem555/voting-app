import '../database.dart';

class TombstoneSemTable extends SupabaseTable<TombstoneSemRow> {
  @override
  String get tableName => 'tombstoneSem';

  @override
  TombstoneSemRow createRow(Map<String, dynamic> data) => TombstoneSemRow(data);
}

class TombstoneSemRow extends SupabaseDataRow {
  TombstoneSemRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TombstoneSemTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  List<double> get coordinates => getListField<double>('coordinates');
  set coordinates(List<double>? value) =>
      setListField<double>('coordinates', value);

  String? get uuidMaster => getField<String>('uuidMaster');
  set uuidMaster(String? value) => setField<String>('uuidMaster', value);

  String? get fio => getField<String>('FIO');
  set fio(String? value) => setField<String>('FIO', value);

  DateTime? get dateOfBirth => getField<DateTime>('dateOfBirth');
  set dateOfBirth(DateTime? value) => setField<DateTime>('dateOfBirth', value);

  DateTime? get dateOfDeath => getField<DateTime>('dateOfDeath');
  set dateOfDeath(DateTime? value) => setField<DateTime>('dateOfDeath', value);

  bool? get public => getField<bool>('Public?');
  set public(bool? value) => setField<bool>('Public?', value);

  List<String> get photos => getListField<String>('photos');
  set photos(List<String>? value) => setListField<String>('photos', value);

  List<String> get uuidOfInvited => getListField<String>('uuidOfInvited');
  set uuidOfInvited(List<String>? value) =>
      setListField<String>('uuidOfInvited', value);
}
