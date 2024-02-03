import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.help),
            ),
          ),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LeftSide(),
                RightSide(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bem vindo ao GitFlow Desktop!',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  height: 1.8,
                ),
          ),
          Text(
            'Um aplicativo para gerenciar o GitFlow no seu repositório local e remoto.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                ),
          ),
          Text(
            'Comece clicando no botão abaixo. Para mais informações, clique no botão de ajuda.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 50),
          OutlinedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              ),
            ),
            onPressed: onStartConfig(context),
            child: const Text('Vamos abrir um repositório!'),
          ),
        ],
      ),
    );
  }

  onStartConfig(BuildContext context) {
    return () {
      GoRouter.of(context).go('/gitconfig');
    };
  }
}

class RightSide extends StatelessWidget {
  const RightSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SvgPicture.asset(
          'lib/presentation/assets/start.svg',
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}
