import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _appVersion = prefs.getString('ff_appVersion') ?? _appVersion;
  }

  SharedPreferences prefs;

  String _appVersion = '1.0.0+1';
  String get appVersion => _appVersion;
  set appVersion(String _value) {
    _appVersion = _value;
    prefs.setString('ff_appVersion', _value);
  }

  bool uiIsAddBucketMenuOpen = false;

  List<String> colorOptions = [
    '4294198070',
    '4293467747',
    '4288423856',
    '4284955319',
    '4282339765',
    '4280391411',
    '4278430196',
    '4278238420',
    '4278228616',
    '4283215696',
    '4287349578',
    '4291681337',
    '4294961979',
    '4294951175',
    '4294940672',
    '4294924066',
    '4286141768',
    '4284513675',
    '4278190080'
  ];
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
