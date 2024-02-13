import 'dart:io';

import 'package:gitdesktop/domain/contracts/services/git.dart';
import 'package:gitdesktop/domain/entities/git_user.dart';

class GitServiceProcess implements GitService {
  @override
  Future<GitUser> loadGlobalUserCredentials() async {
    final email = await Process.run('git', GitUser.getGlobalEmailCommand());
    final name = await Process.run('git', GitUser.getGlobalNameCommand());

    if (email.exitCode != 0 || name.exitCode != 0) {
      throw Exception('Error loading global user credentials');
    }

    return GitUser(
      email: email.stdout.toString(),
      name: name.stdout.toString(),
    );
  }

  @override
  Future<void> saveGlobalUserCredentials(GitUser user) async {
    final emailResult = await Process.run('git', user.setGlobalEmailCommand());
    final nameResult = await Process.run('git', user.setGlobalNameCommand());

    if (emailResult.exitCode != 0 || nameResult.exitCode != 0) {
      throw Exception('Error saving global user credentials');
    }
  }
}
