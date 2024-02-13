import 'package:flutter/material.dart';
import 'package:gitdesktop/domain/entities/git_user.dart';
import 'package:gitdesktop/domain/useCases/git.dart';
import 'package:gitdesktop/domain/useCases/preferencies.dart';
import 'package:go_router/go_router.dart';

class FirstTimeNotifier extends ChangeNotifier {
  final PreferenciesGetFirstTime _getFirstTime;
  final PreferenciesSetFirstTime _setFirstTime;
  final LoadGlobalUserCredentialsGit _loadGlobalUserCredentials;
  final SaveGlobalUserCredentialsGit _saveGlobalUserCredentials;
  final GoRouter _router;

  FirstTimeNotifier(this._getFirstTime, this._setFirstTime, this._router,
      this._loadGlobalUserCredentials, this._saveGlobalUserCredentials);

  Future<void> isFirstTime() async {
    final value = await _getFirstTime();

    if (value) {
      _router.go('/start');
      return;
    }

    _router.go('/openrepo');
  }

  Future<bool> getFirstTime() async {
    final result = await _getFirstTime();

    return result;
  }

  Future<void> setFirstTime(bool value) async {
    await _setFirstTime(value);
    notifyListeners();
  }

  Future<GitUser> loadGlobalUserCredentials() async {
    final result = await _loadGlobalUserCredentials();

    return result;
  }

  Future<void> saveGlobalUserCredentials(String name, String email) async {
    final user = GitUser(name: name, email: email);

    await _saveGlobalUserCredentials(user);
    await setFirstTime(false);
  }
}
