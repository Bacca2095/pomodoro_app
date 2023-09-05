import 'package:equatable/equatable.dart';

class SignInFormEvent extends Equatable {
  final String email;
  final String password;
  final bool rememberMe;

  const SignInFormEvent({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  @override
  List<Object?> get props => [email, password, rememberMe];
}
