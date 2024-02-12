import 'package:flutter/material.dart';
import 'package:gitdesktop/domain/useCases/preferencies.dart';
import 'package:gitdesktop/useCases/preferencies/set_first_time.dart';

class FirstTimeNotifier extends ChangeNotifier {
  final PreferenciesGetFirstTime _getFirstTime;
  final PreferencesSetFirstTimeUseCase _setFirstTime;

  FirstTimeNotifier(this._getFirstTime, this._setFirstTime);

  Future<bool> isFirstTime() async {
    final result = await _getFirstTime();
    return result;
  }

  Future<void> setFirstTime(bool value) async {
    await _setFirstTime(value);
    notifyListeners();
  }
}
