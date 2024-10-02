import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/addtodoscreen.dart';
import 'package:myapp/loginscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/todolistscreen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Loginscreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'dashboard',
          name: 'dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const Todolistscreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'addtodo',
              name: 'addtodo',
              builder: (BuildContext context, GoRouterState state) {
                return const Addtodo();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routerConfig: _router,
    );
  }
}
