import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pomodoro_app/features/auth/presentation/bloc/local/sign_in/sign_in_form_bloc.dart';
import 'package:pomodoro_app/features/auth/presentation/bloc/local/sign_in/sign_in_form_event.dart';
import 'package:pomodoro_app/features/auth/presentation/bloc/local/sign_in/sign_in_form_state.dart';
import 'package:pomodoro_app/features/auth/presentation/widgets/auth_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_app/injection_container.dart';

class SingInEmail extends HookWidget {
  const SingInEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final showPassword = useState<bool>(false);
    final emailController =
        useState<TextEditingController>(TextEditingController());
    final passwordController =
        useState<TextEditingController>(TextEditingController());

    return BlocProvider<SignInFormBloc>(
        create: (_) => sl<SignInFormBloc>(),
        child: BlocBuilder<SignInFormBloc, SignInFormState>(
          builder: (context, state) => Center(
              child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.sign_in_with_email_message,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold)),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          validator:
                              ValidationBuilder().required().email().build(),
                          controller: emailController.value,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            BlocProvider.of<SignInFormBloc>(context).add(
                              SignInFormEvent(
                                  email: value,
                                  password: state.password,
                                  rememberMe: state.rememberMe),
                            );
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                            ),
                            hintText: AppLocalizations.of(context)!.input_email,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController.value,
                          keyboardType: TextInputType.visiblePassword,
                          validator: ValidationBuilder()
                              .required()
                              .minLength(8)
                              .build(),
                          obscureText: true,
                          onChanged: (value) {
                            BlocProvider.of<SignInFormBloc>(context).add(
                              SignInFormEvent(
                                  email: state.email,
                                  password: value,
                                  rememberMe: state.rememberMe),
                            );
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                            hintText:
                                AppLocalizations.of(context)!.input_password,
                            suffixIcon: IconButton(
                              onPressed: () {
                                showPassword.value = !showPassword.value;
                              },
                              icon: Icon(
                                showPassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: state.rememberMe,
                              onChanged: (value) {
                                if (value != null) {
                                  BlocProvider.of<SignInFormBloc>(context).add(
                                    SignInFormEvent(
                                        email: state.email,
                                        password: state.password,
                                        rememberMe: value),
                                  );
                                }
                              },
                            ),
                            Text(AppLocalizations.of(context)!.remember_me),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(AppLocalizations.of(context)!.sign_in),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(AppLocalizations.of(context)!
                                .sign_in_forgot_password),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Divider(
                              height: 96,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            Container(
                              color: Theme.of(context).colorScheme.background,
                              width: 120,
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppLocalizations.of(context)!.or_continue,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.apple,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!
                                .sign_in_no_account),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/SignUp');
                                },
                                child: Text(
                                    AppLocalizations.of(context)!.sing_up,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        ));
  }
}
