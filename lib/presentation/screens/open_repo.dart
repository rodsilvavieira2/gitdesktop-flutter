import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gitdesktop/main/injection.dart';
import 'package:gitdesktop/presentation/components/back_btn.dart';
import 'package:gitdesktop/presentation/config/router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FirstOpenGitRepoScreen extends ConsumerWidget {
  const FirstOpenGitRepoScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(getIt<FirstTimeProvider>());

    return Scaffold(
      body: FutureBuilder(
        future: provider.getFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final isUserFirstTime = snapshot.data;

            return Stack(
              children: [
                if (isUserFirstTime == true) const BackBtn(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Como você deseja começar?',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Text(
                        'Você pode começar um novo repositório ou clonar um existente.',
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OpenRepoType(
                            body1: 'Abrir um repositório',
                            body2:
                                'Abrir um repositório existente no seu computador',
                            icon: PhosphorIconsRegular.folderOpen,
                            onPress: openLocalRepoFolder(context),
                          ),
                          const SizedBox(width: 20),
                          OpenRepoType(
                            body1: 'Clone um repositório',
                            body2:
                                'Clone um repositório existente de um servidor remoto',
                            icon: PhosphorIconsRegular.download,
                            onPress: () {},
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OpenRepoType(
                            body1: 'Crie um novo repositório',
                            body2: 'Comece um novo repositório',
                            icon: PhosphorIconsRegular.plus,
                            onPress: () {},
                          ),
                          const SizedBox(width: 20),
                          OpenRepoType(
                            body1: 'Agrupe repositórios',
                            body2: 'Agrupe repositórios em um diretório',
                            icon: PhosphorIconsRegular.stack,
                            onPress: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  openLocalRepoFolder(BuildContext context) {
    return () async {
      await FilePicker.platform
          .getDirectoryPath(dialogTitle: "Selecione a pasta do repositório");

      router.push('/workspace');
    };
  }
}

class OpenRepoType extends StatelessWidget {
  final String body1;
  final String body2;
  final VoidCallback onPress;
  final IconData icon;

  const OpenRepoType({
    super.key,
    required this.body1,
    required this.body2,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(300, 90),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                body1,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
