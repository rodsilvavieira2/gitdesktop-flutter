import 'package:gitdesktop/presentation/screens/git_config.dart';
import 'package:gitdesktop/presentation/screens/open_repo.dart';
import 'package:gitdesktop/presentation/screens/start.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
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
  ],
);
