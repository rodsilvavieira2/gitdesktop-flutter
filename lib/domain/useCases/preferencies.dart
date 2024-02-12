abstract class PreferenciesGetFirstTime {
  Future<bool> call();
}

abstract class PreferenciesSetFirstTime {
  Future<void> call(bool value);
}
