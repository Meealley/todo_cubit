// import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:todo_cube/home/todo_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/todo',
  routes: <RouteBase>[
    GoRoute(
      path: '/todo',
      name: '/todo',
      builder: (context, state) {
        return const TodoScreen();
      },
    )
  ],
);
