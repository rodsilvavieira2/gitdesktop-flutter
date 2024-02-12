import 'package:gitdesktop/domain/entities/git_user.dart';

abstract class GitLoadGlobalUserCredentials {
  Future<GitUser?> call();
}

abstract class GitSaveGlobalUserCredentials {
  Future<void> call(GitUser user);
}
