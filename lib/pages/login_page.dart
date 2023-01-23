import 'package:chat_app/config/app_route.dart';
import 'package:chat_app/config/session.dart';
import 'package:chat_app/controller/c_user.dart';
import 'package:chat_app/source/user_source.dart';
import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  login(BuildContext context) {
    UserSource.login(controllerUsername.text, controllerPassword.text)
        .then((responseBody) {
      if (responseBody['success']) {
        var mapUser = Map<String, dynamic>.from(responseBody['success']);
        User user = User.fromJson(mapUser);
        Session.setUser(user);
        context.read<CUser>().data = user;

        DInfo.dialogSuccess(context, "Login Success");
        DInfo.closeDialog(context, actionAfterClose: () {
          context.go(AppRoute.home);
        });
      } else {
        DInfo.snackBarError(context, "Login failed");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.purple])),
      child: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DView.nothing(),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        DView.textTitle("Login"),
                        DView.spaceHeight(8),
                        const Divider(),
                        DView.spaceHeight(4),
                        DInput(
                          controller: controllerUsername,
                          title: "Username",
                          spaceTitle: 4,
                        ),
                        DView.spaceHeight(),
                        DInput(
                          controller: controllerPassword,
                          title: "Password",
                          spaceTitle: 4,
                        ),
                        DView.spaceHeight(),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text("Login")))
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                        onPressed: () {
                          context.push(AppRoute.register);
                        },
                        child: const Text(
                          "Register here",
                          style: TextStyle(color: Colors.white70),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      }),
    ));
  }
}
