import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodoro_app/features/auth/presentation/widgets/auth_button_widget.dart';

class SingIn extends HookWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Let's you in",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ListView(
            shrinkWrap: true,
            children: [
              AuthButtonWidget(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      Text('Continue with Facebook'),
                    ],
                  )),
              const SizedBox(height: 10),
              AuthButtonWidget(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/google.svg',
                        height: 20,
                        semanticsLabel: 'Google Logo',
                      ),
                      const SizedBox(width: 10),
                      const Text('Continue with Google'),
                    ],
                  )),
              const SizedBox(height: 10),
              AuthButtonWidget(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.apple,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('Continue with Apple'),
                    ],
                  )),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  const Divider(
                    height: 96,
                    color: Colors.grey,
                  ),
                  Container(
                    color: Colors.white,
                    width: 32,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'or',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Profile');
                    },
                    child: const Text('Sign in with email')),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/SignUp');
                      },
                      child: const Text('Sign up',
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
