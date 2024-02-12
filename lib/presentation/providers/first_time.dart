import 'package:flutter/material.dart';
import 'package:gitdesktop/domain/useCases/preferencies.dart';
import 'package:go_router/go_router.dart';

class FirstTimeNotifier extends ChangeNotifier {
  final PreferenciesGetFirstTime _getFirstTime;
  final PreferenciesSetFirstTime _setFirstTime;
  final GoRouter _router;

  FirstTimeNotifier(this._getFirstTime, this._setFirstTime, this._router);

  Future<void> isFirstTime() async {
    final value = await _getFirstTime();

    if (value) {
      _router.go('/start');
      return;
    }

    _router.go('/workspace');
  }

  Future<void> setFirstTime(bool value) async {
    await _setFirstTime(value);
    notifyListeners();
  }
}
