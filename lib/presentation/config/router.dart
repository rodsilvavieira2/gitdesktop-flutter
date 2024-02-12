import 'package:gitdesktop/presentation/screens/git_config.dart';
import 'package:gitdesktop/presentation/screens/loading.dart';
import 'package:gitdesktop/presentation/screens/open_repo.dart';
import 'package:gitdesktop/presentation/screens/start.dart';
import 'package:gitdesktop/presentation/screens/workspace.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/start',
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: '/gitconfig',
      builder: (context, state) => const GitConfigScreen(),
    ),
    GoRoute(
      path: '/firstopenrepo',
      builder: (context, state) => const FirstOpenGitRepoScreen(),
    ),
    GoRoute(
      path: '/workspace',
      builder: (context, state) => const WorkSpaceScreen(),
    ),
  ],
);
