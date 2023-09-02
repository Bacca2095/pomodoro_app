import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomodoro_app/features/auth/presentation/widgets/auth_button_widget.dart';

class SingUp extends HookWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Create your Account",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text('Remember me'),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign Up'),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    const Divider(
                      height: 96,
                      color: Colors.grey,
                    ),
                    Container(
                      color: Colors.white,
                      width: 120,
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'or continue with',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
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
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    AuthButtonWidget(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.apple,
                              color: Colors.black,
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignIn');
                        },
                        child: const Text('Sign in',
                            style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
