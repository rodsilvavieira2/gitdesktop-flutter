import 'package:gitdesktop/domain/contracts/data/preferencies.dart';
import 'package:gitdesktop/domain/useCases/preferencies.dart';

class PreferencesSetFirstTimeUseCase implements PreferenciesSetFirstTime {
  final PreferenciesData _repo;

  PreferencesSetFirstTimeUseCase(this._repo);

  @override
  Future<void> call(bool value) async {
    return _repo.setFirstTime(value);
  }
}
