import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:gitdesktop/domain/contracts/data/preferencies.dart';
import 'package:gitdesktop/domain/contracts/services/git.dart';
import 'package:gitdesktop/domain/useCases/git.dart';
import 'package:gitdesktop/domain/useCases/preferencies.dart';
import 'package:gitdesktop/infra/data/shared_prefericiens.dart';
import 'package:gitdesktop/infra/services/git.dart';
import 'package:gitdesktop/presentation/config/router.dart';
import 'package:gitdesktop/presentation/providers/first_time.dart';
import 'package:gitdesktop/useCases/git/load_global_user_credentials.dart';
import 'package:gitdesktop/useCases/git/save_global_user_credentials.dart';
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

  getIt.registerSingleton<GitService>(GitServiceProcess());

  getIt.registerSingleton<LoadGlobalUserCredentialsGit>(
    LoadGlobalUserCredentialsGitUseCase(getIt()),
  );

  getIt.registerSingleton<SaveGlobalUserCredentialsGit>(
    SaveGlobalUserCredentialsGitUseCase(getIt()),
  );

  getIt.registerSingleton<FirstTimeProvider>(
    ChangeNotifierProvider<FirstTimeNotifier>(
      (ref) => FirstTimeNotifier(
        getIt(),
        getIt(),
        router,
        getIt(),
      ),
    ),
  );
}
