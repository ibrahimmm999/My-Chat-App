import 'package:chat_app/config/app_route.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.purple])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DView.nothing(),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
    ));
  }
}
