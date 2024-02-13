import 'package:gitdesktop/domain/contracts/services/git.dart';
import 'package:gitdesktop/domain/entities/git_user.dart';
import 'package:gitdesktop/domain/useCases/git.dart';

class SaveGlobalUserCredentialsGitUseCase
    implements SaveGlobalUserCredentialsGit {
  final GitService service;

  SaveGlobalUserCredentialsGitUseCase(this.service);

  @override
  Future<void> call(GitUser user) async {
    return await service.saveGlobalUserCredentials(user);
  }
}
