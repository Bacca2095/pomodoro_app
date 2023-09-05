import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodoro_app/features/auth/presentation/widgets/auth_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SingIn extends HookWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  _buildBody(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.sign_in_message,
              style:
                  const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ListView(
            shrinkWrap: true,
            children: [
              AuthButtonWidget(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      Text(AppLocalizations.of(context)!
                          .sign_in_continue_with('facebook')),
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
                      Text(AppLocalizations.of(context)!
                          .sign_in_continue_with('google')),
                    ],
                  )),
              const SizedBox(height: 10),
              AuthButtonWidget(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.apple,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      const SizedBox(width: 10),
                      Text(AppLocalizations.of(context)!
                          .sign_in_continue_with('apple')),
                    ],
                  )),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Divider(
                    height: 96,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.background,
                    width: 32,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.or,
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
                      Navigator.pushNamed(context, '/SignInEmail');
                    },
                    child:
                        Text(AppLocalizations.of(context)!.sign_in_with_email)),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.sign_in_no_account),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/SignUp');
                      },
                      child: Text(AppLocalizations.of(context)!.sing_up,
                          style: const TextStyle(fontWeight: FontWeight.bold)))
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
