import 'package:gitdesktop/domain/entities/git_user.dart';

abstract class LoadGlobalUserCredentialsGit {
  Future<GitUser> call();
}

abstract class SaveGlobalUserCredentialsGit {
  Future<void> call(GitUser user);
}
