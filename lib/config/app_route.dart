import 'package:chat_app/config/session.dart';
import 'package:chat_app/controller/c_add_topic.dart';
import 'package:chat_app/controller/c_comment.dart';
import 'package:chat_app/controller/c_follower.dart';
import 'package:chat_app/controller/c_following.dart';
import 'package:chat_app/controller/c_profile.dart';
import 'package:chat_app/controller/c_search.dart';
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
  static const profile = '/profile';
  static const search = '/search';
  static const follower = '/follower';
  static const following = '/following';
  static const comment = '/comment';

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
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: register,
          builder: (context, state) => RegisterPage(),
        ),
        GoRoute(
          path: addTopic,
          builder: (context, state) => ChangeNotifierProvider(
            child: const Scaffold(),
            create: (_) => CAddTopic(),
          ),
        ),
        GoRoute(
          path: profile,
          builder: (context, state) => ChangeNotifierProvider(
            child: const Scaffold(),
            create: (_) => CProfile(),
          ),
        ),
        GoRoute(
          path: search,
          builder: (context, state) => ChangeNotifierProvider(
            child: const Scaffold(),
            create: (_) => CSearch(),
          ),
        ),
        GoRoute(
          path: follower,
          builder: (context, state) => ChangeNotifierProvider(
            child: const Scaffold(),
            create: (_) => CFollower(),
          ),
        ),
        GoRoute(
          path: following,
          builder: (context, state) => ChangeNotifierProvider(
            child: const Scaffold(),
            create: (_) => CFollowing(),
          ),
        ),
        GoRoute(
          path: comment,
          builder: (context, state) => ChangeNotifierProvider(
            child: const Scaffold(),
            create: (_) => CComment(),
          ),
        ),
      ]);
}
