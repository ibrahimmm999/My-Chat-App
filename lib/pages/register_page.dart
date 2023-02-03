import 'package:chat_app/source/user_source.dart';
import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  register(BuildContext context) {
    UserSource.register(controllerUsername.text, controllerPassword.text)
        .then((responseBody) {
      if (responseBody['success']) {
        DInfo.dialogSuccess(context, "Register Success");
        DInfo.closeDialog(context, actionAfterClose: () {
          context.pop();
        });
      } else {
        if (responseBody['message'] == 'username') {
          DInfo.snackBarError(context, "username has already taken");
        } else {
          DInfo.snackBarError(context, "Register failed");
        }
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
                        DView.textTitle("Register"),
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
                                onPressed: () {},
                                child: const Text("Register")))
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text(
                          "Login here",
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
