import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gitdesktop/presentation/components/back_btn.dart';
import 'package:gitdesktop/presentation/config/screen_sizes.dart';
import 'package:go_router/go_router.dart';

class GitConfigScreen extends StatelessWidget {
  const GitConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackBtn(),
          Center(
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
            'Confirme suas credenciais para git commits',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  height: 1.8,
                ),
          ),
          const Text('Isso será usado para commits locais e remotos.'),
          const SizedBox(height: 50),
          const GitCredentialsForm(),
          const SizedBox(height: 50),
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

class GitCredentialsForm extends StatelessWidget {
  const GitCredentialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var breakpoint = screenSizes['md'] ?? 1;

    var width = screenSize.width > breakpoint
        ? screenSize.width * 0.3
        : screenSize.width * 0.4;

    return SizedBox(
      width: width,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nome de usuário',
              hintText: 'Digite seu nome de usuário',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'E-mail',
              hintText: 'Digite seu e-mail',
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              ),
            ),
            onPressed: () {},
            child: const Text('Confirmar!'),
          ),
        ],
      ),
    );
  }
}
