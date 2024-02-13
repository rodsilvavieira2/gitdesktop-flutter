import 'package:gitdesktop/domain/contracts/services/git.dart';
import 'package:gitdesktop/domain/entities/git_user.dart';
import 'package:gitdesktop/domain/useCases/git.dart';

class LoadGlobalUserCredentialsGitUseCase
    implements LoadGlobalUserCredentialsGit {
  final GitService service;

  LoadGlobalUserCredentialsGitUseCase(this.service);

  @override
  Future<GitUser> call() async {
    return await service.loadGlobalUserCredentials();
  }
}
