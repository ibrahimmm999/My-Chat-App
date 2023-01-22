import 'package:chat_app/config/session.dart';
import 'package:chat_app/controller/c_add_topic.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/pages/error_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';
  static const addTopic = '/add-topic';

  static GoRouter routerConfig = GoRouter(
      debugLogDiagnostics: true,
      errorBuilder: (context, state) =>
          ErrorPage(title: "Something Error", desc: state.error.toString()),
      redirect: (context, state) async {
        User? user = await Session.getUser();
        if (user == null) {
          if (state.location == login || state.location == register) {
            return null;
          }
          return login;
        }
        return null;
      },
      routes: [
        GoRoute(
          path: home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: register,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: addTopic,
          builder: (context, state) => ChangeNotifierProvider(
            child: const Scaffold(),
            create: (context) => CAddTopic(),
          ),
        ),
      ]);
}
