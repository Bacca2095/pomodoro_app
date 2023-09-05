import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_app/features/auth/presentation/bloc/local/sign_in/sign_in_form_event.dart';
import 'package:pomodoro_app/features/auth/presentation/bloc/local/sign_in/sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc()
      : super(const SignInFormState(
          email: '',
          password: '',
          rememberMe: false,
        )) {
    on<SignInFormEvent>(onUpdateForm);
  }

  void onUpdateForm(
      SignInFormEvent event, Emitter<SignInFormState> emit) async {
    emit(SignInFormState(
      email: event.email,
      password: event.password,
      rememberMe: event.rememberMe,
    ));
  }
}
