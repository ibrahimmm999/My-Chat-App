import 'package:chat_app/config/session.dart';
import 'package:chat_app/model/user.dart';
import 'package:chat_app/pages/error_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';

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
      ]);
}
