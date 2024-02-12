import 'package:gitdesktop/domain/contracts/data/preferencies.dart';
import 'package:gitdesktop/domain/useCases/preferencies.dart';

class PreferenciesGetFirstTimeUseCase implements PreferenciesGetFirstTime {
  final PreferenciesData _repo;

  PreferenciesGetFirstTimeUseCase(this._repo);

  @override
  Future<bool> call() async {
    return await _repo.isFirstTime();
  }
}
