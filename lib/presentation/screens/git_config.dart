import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gitdesktop/main/injection.dart';
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

class GitCredentialsForm extends ConsumerStatefulWidget {
  const GitCredentialsForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return GitCredentialsFormState();
  }
}

class GitCredentialsFormState extends ConsumerState<GitCredentialsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameControl = TextEditingController();
  final TextEditingController _emailControl = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.read(getIt<FirstTimeProvider>()).loadGlobalUserCredentials().then(
      (value) {
        setState(() {
          _emailControl.text = value.email;
          _nameControl.text = value.name;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    _nameControl.dispose();
    _emailControl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var breakpoint = screenSizes['md'] ?? 1;

    var width = screenSize.width > breakpoint
        ? screenSize.width * 0.3
        : screenSize.width * 0.4;

    return SizedBox(
      width: width,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameControl,
              decoration: const InputDecoration(
                labelText: 'Nome de usuário',
                hintText: 'Digite seu nome de usuário',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite um nome de usuário';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailControl,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                hintText: 'Digite seu e-mail',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite um e-mail';
                }

                return null;
              },
            ),
            const SizedBox(height: 50),
            OutlinedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
              onPressed: onOpenFirstOpenRepo(context),
              child: const Text('Confirmar!'),
            ),
          ],
        ),
      ),
    );
  }

  onOpenFirstOpenRepo(BuildContext context) {
    return () {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Credenciais confirmadas!'),
          ),
        );

        GoRouter.of(context).push('/firstopenrepo');

        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha os campos corretamente!'),
        ),
      );
    };
  }
}
