import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:gitdesktop/domain/contracts/data/preferencies.dart';
import 'package:gitdesktop/domain/useCases/preferencies.dart';
import 'package:gitdesktop/infra/data/shared_prefericiens.dart';
import 'package:gitdesktop/presentation/config/router.dart';
import 'package:gitdesktop/presentation/providers/first_time.dart';
import 'package:gitdesktop/useCases/preferencies/get_first_time.dart';
import 'package:gitdesktop/useCases/preferencies/set_first_time.dart';

final getIt = GetIt.instance;

typedef FirstTimeProvider = ChangeNotifierProvider<FirstTimeNotifier>;

void setUpInjection() {
  getIt.registerSingleton<PreferenciesData>(SharedPreferenciesRepository());

  getIt.registerSingleton<PreferenciesGetFirstTime>(
    PreferenciesGetFirstTimeUseCase(getIt()),
  );

  getIt.registerSingleton<PreferenciesSetFirstTime>(
    PreferencesSetFirstTimeUseCase(getIt()),
  );

  getIt.registerSingleton<FirstTimeProvider>(
    ChangeNotifierProvider<FirstTimeNotifier>(
      (ref) => FirstTimeNotifier(getIt(), getIt(), router),
    ),
  );
}
