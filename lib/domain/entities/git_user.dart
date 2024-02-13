import 'package:equatable/equatable.dart';

class GitUser extends Equatable {
  final String name;
  final String email;

  const GitUser({required this.name, required this.email});

  @override
  List<Object> get props => [name, email];

  set name(String value) {
    name = value;
  }

  set email(String value) {
    email = value;
  }

  static getGlobalNameCommand() {
    final userName = ['config', '--global', 'user.name'];

    return userName;
  }

  static getGlobalEmailCommand() {
    final userEmail = ['config', '--global', 'user.email'];

    return userEmail;
  }

  setGlobalNameCommand() {
    final userName = ['config', '--global', 'user.name', name];

    return userName;
  }

  setGlobalEmailCommand() {
    final userEmail = ['config', '--global', 'user.email', email];

    return userEmail;
  }

  factory GitUser.empty() {
    return const GitUser(name: '', email: '');
  }

  bool get isEmpty => name.isEmpty && email.isEmpty;
}
