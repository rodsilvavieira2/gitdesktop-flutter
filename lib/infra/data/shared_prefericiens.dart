// ignore_for_file: constant_identifier_names

import 'package:gitdesktop/domain/contracts/data/preferencies.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenciesRepository implements PreferenciesData {
  final Future<SharedPreferences> _repo = SharedPreferences.getInstance();

  static const String _FIRST_TIME = "@GITDESKTOP/FIRST_TIME";

  @override
  Future<bool> isFirstTime() async {
    final SharedPreferences pref = await _repo;

    return pref.getBool(_FIRST_TIME) ?? true;
  }

  @override
  Future<void> setFirstTime(bool value) async {
    final SharedPreferences pref = await _repo;

    pref.setBool(_FIRST_TIME, value);
  }
}
