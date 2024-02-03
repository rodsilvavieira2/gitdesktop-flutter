import 'package:flutter/material.dart';

class FirstOpenGitRepoScreen extends StatelessWidget {
  const FirstOpenGitRepoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Open Git Repository',
            ),
          ],
        ),
      ),
    );
  }
}
