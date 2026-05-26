import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _password = prefs.getString('ff_password') ?? _password;
    });
    _safeInit(() {
      _login = prefs.getString('ff_login') ?? _login;
    });
    _safeInit(() {
      _checkData = prefs.containsKey('ff_checkData')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_checkData')!)
          : _checkData;
    });
    _safeInit(() {
      _permission = prefs.getBool('ff_permission') ?? _permission;
    });
    _safeInit(() {
      _createStringUsersSap =
          prefs.getBool('ff_createStringUsersSap') ?? _createStringUsersSap;
    });
    _safeInit(() {
      _phone = prefs.getString('ff_phone') ?? _phone;
    });
    _safeInit(() {
      _onesignalPermission =
          prefs.getInt('ff_onesignalPermission') ?? _onesignalPermission;
    });
    _safeInit(() {
      _subscriptionID = prefs.getString('ff_subscriptionID') ?? _subscriptionID;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    prefs.setString('ff_password', value);
  }

  String _login = '';
  String get login => _login;
  set login(String value) {
    _login = value;
    prefs.setString('ff_login', value);
  }

  CreateAnketaStruct _createAnketa = CreateAnketaStruct();
  CreateAnketaStruct get createAnketa => _createAnketa;
  set createAnketa(CreateAnketaStruct value) {
    _createAnketa = value;
  }

  void updateCreateAnketaStruct(Function(CreateAnketaStruct) updateFn) {
    updateFn(_createAnketa);
  }

  List<int> _array = [];
  List<int> get array => _array;
  set array(List<int> value) {
    _array = value;
  }

  void addToArray(int value) {
    array.add(value);
  }

  void removeFromArray(int value) {
    array.remove(value);
  }

  void removeAtIndexFromArray(int index) {
    array.removeAt(index);
  }

  void updateArrayAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    array[index] = updateFn(_array[index]);
  }

  void insertAtIndexInArray(int index, int value) {
    array.insert(index, value);
  }

  DateTime? _checkData = DateTime.fromMillisecondsSinceEpoch(1748749920000);
  DateTime? get checkData => _checkData;
  set checkData(DateTime? value) {
    _checkData = value;
    value != null
        ? prefs.setInt('ff_checkData', value.millisecondsSinceEpoch)
        : prefs.remove('ff_checkData');
  }

  List<BazaAnketStruct> _arrayAnket = [];
  List<BazaAnketStruct> get arrayAnket => _arrayAnket;
  set arrayAnket(List<BazaAnketStruct> value) {
    _arrayAnket = value;
  }

  void addToArrayAnket(BazaAnketStruct value) {
    arrayAnket.add(value);
  }

  void removeFromArrayAnket(BazaAnketStruct value) {
    arrayAnket.remove(value);
  }

  void removeAtIndexFromArrayAnket(int index) {
    arrayAnket.removeAt(index);
  }

  void updateArrayAnketAtIndex(
    int index,
    BazaAnketStruct Function(BazaAnketStruct) updateFn,
  ) {
    arrayAnket[index] = updateFn(_arrayAnket[index]);
  }

  void insertAtIndexInArrayAnket(int index, BazaAnketStruct value) {
    arrayAnket.insert(index, value);
  }

  bool _permission = false;
  bool get permission => _permission;
  set permission(bool value) {
    _permission = value;
    prefs.setBool('ff_permission', value);
  }

  bool _createStringUsersSap = false;
  bool get createStringUsersSap => _createStringUsersSap;
  set createStringUsersSap(bool value) {
    _createStringUsersSap = value;
    prefs.setBool('ff_createStringUsersSap', value);
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    prefs.setString('ff_phone', value);
  }

  int _version = 1;
  int get version => _version;
  set version(int value) {
    _version = value;
  }

  int _onesignalPermission = 0;
  int get onesignalPermission => _onesignalPermission;
  set onesignalPermission(int value) {
    _onesignalPermission = value;
    prefs.setInt('ff_onesignalPermission', value);
  }

  String _subscriptionID = '';
  String get subscriptionID => _subscriptionID;
  set subscriptionID(String value) {
    _subscriptionID = value;
    prefs.setString('ff_subscriptionID', value);
  }

  String _newOrOld = '';
  String get newOrOld => _newOrOld;
  set newOrOld(String value) {
    _newOrOld = value;
  }

  String _messageCode = '';
  String get messageCode => _messageCode;
  set messageCode(String value) {
    _messageCode = value;
  }

  String _smsCode = '1111';
  String get smsCode => _smsCode;
  set smsCode(String value) {
    _smsCode = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
