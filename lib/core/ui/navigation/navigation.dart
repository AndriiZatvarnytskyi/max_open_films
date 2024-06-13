import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:films/core/ui/utils/extensions.dart';
import 'package:films/feature/film/ui/film_screen.dart';
import 'package:films/feature/latest/ui/latest_screen.dart';

import '../../../feature/home/ui/home_screen.dart';
import '../../../feature/main/ui/main_screen.dart';
import '../../../feature/search/ui/search_screen.dart';
import '../../../feature/bookmarks/ui/bookmarks_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/film',
      builder: (context, state) => FilmScreen(
        id: state.uri.queryParameters['id']!,
        navigationBack: context.pop,
      ),
    ),
    ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shell'),
        pageBuilder: (context, state, child) => _defaultTransition(
              context: context,
              state: state,
              child: HomeScreen(
                child: child,
                navigateToMain: () => context.go('/main'),
                navigateToSearch: () => context.go('/search'),
                navigateToBookmark: () => context.go('/bookmarks'),
              ),
            ),
        routes: [
          GoRoute(
              path: '/main',
              builder: (context, state) => MainScreen(
                    navigateToChat: () => context.push('/main/latest'),
                    navigateToFilm: (String id) => context.push(
                      '/film'.addQueryParams({'id': id}),
                    ),
                  ),
              routes: [
                GoRoute(
                    path: 'latest',
                    builder: (context, state) => LatestScreen(
                          navigateBack: context.pop,
                          navigateToFilm: (String id) => context.push(
                            '/film'.addQueryParams({'id': id}),
                          ),
                        )),
              ]),
          GoRoute(
              path: '/bookmarks',
              builder: (context, state) => BookmarksScreen(
                    navigateToFilm: (String id) => context.push(
                      '/film'.addQueryParams({'id': id}),
                    ),
                  )),
          GoRoute(
              path: '/search',
              builder: (context, state) => SearchScreen(
                    navigateToFilm: (String id) => context.push(
                      '/film'.addQueryParams({'id': id}),
                    ),
                  )),
        ])
  ],
);

CustomTransitionPage _defaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool fullscreenDialog = false,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    fullscreenDialog: fullscreenDialog,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
