import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LeftSide(),
            RightSide(),
          ],
        ),
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
          const SizedBox(height: 20),
          FilledButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              ),
            ),
            onPressed: () {},
            child: const Text('Vamos abrir um repositório!'),
          ),
        ],
      ),
    );
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
