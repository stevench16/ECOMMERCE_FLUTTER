abstract class LoginBlocState {}
class LoginInitial extends LoginBlocState {}

class LoginFormState extends LoginBlocState {
  final bool emailTouched;
  final bool passwordTouched;

  LoginFormState({
    required this.emailTouched,
    required this.passwordTouched,
  });

  factory LoginFormState.initial() {
    return LoginFormState(emailTouched: false, passwordTouched: false);
  }

  LoginFormState copyWith({bool? emailTouched, bool? passwordTouched}) {
    return LoginFormState(
      emailTouched: emailTouched ?? this.emailTouched,
      passwordTouched: passwordTouched ?? this.passwordTouched,
    );
  }
}