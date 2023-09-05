import 'package:equatable/equatable.dart';

class SignInFormState extends Equatable {
  final String email;
  final String password;
  final bool rememberMe;

  const SignInFormState({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  @override
  List<Object?> get props => [email, password, rememberMe];
}
