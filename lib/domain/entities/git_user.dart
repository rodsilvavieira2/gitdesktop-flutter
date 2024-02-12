import 'package:equatable/equatable.dart';

class GitUser extends Equatable {
  final String name;
  final String email;

  const GitUser({required this.name, required this.email});

  @override
  List<Object> get props => [name, email];

  static getGlobalNameCommand() {
    final userName = ['git', 'config', '--global', 'user.name'];

    return userName;
  }

  static getGlobalEmailCommand() {
    final userEmail = ['git', 'config', '--global', 'user.email'];

    return userEmail;
  }
}
