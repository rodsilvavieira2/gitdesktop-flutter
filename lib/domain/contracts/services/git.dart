import 'package:gitdesktop/domain/entities/git_user.dart';

abstract class GitService {
  Future<GitUser> loadGlobalUserCredentials();
  Future<void> saveGlobalUserCredentials(GitUser user);
}
