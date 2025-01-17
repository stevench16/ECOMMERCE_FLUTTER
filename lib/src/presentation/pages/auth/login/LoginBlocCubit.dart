import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  //LoginBlocCubit() : super(LoginInitial());
  LoginBlocCubit() : super(LoginFormState.initial());

  final _emailController = BehaviorSubject<String>.seeded('');
  final _passwordController = BehaviorSubject<String>.seeded('');

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void changeEmail(String email) {
    final currentState = state as LoginFormState;

    if (email.isEmpty && currentState.emailTouched) {
      _emailController.sink.addError('El campo no puede estar vacío');
    } else if (!email.contains('@')) {
      _emailController.sink.addError('La dirección de correo no es válida.');
    } else if (!RegExp(
            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|gov\.co|edu\.co|org|net|co|info)$")
        .hasMatch(email)) {
      _emailController.sink.addError(
          'La dirección de correo no es válida.');
    } else {
      _emailController.sink.add(email);
      //emit(state.copyWith(isEmailValid: true));
    }
  }

  void changePassword(String password) {
    final currentState = state as LoginFormState;
    // Validación del campo de contraseña
    if (password.isEmpty && currentState.passwordTouched) {
      _passwordController.sink.addError('La contraseña no puede estar vacía');
    } else if (password.length < 6) {
      _passwordController.sink
          .addError('La contraseña debe tener al menos 6 caracteres.');
    } else if (!RegExp(
            r"(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{6,}")
        .hasMatch(password)) {
      _passwordController.sink.addError(
          'La contraseña debe Incluir:Mayúsculas, Minúsculas, números y Carácteres.');
    } else {
      _passwordController.sink.add(password);
      //emit(state.copyWith(isPasswordValid: true));
    }
  }

  void markEmailTouched() {
    emit((state as LoginFormState).copyWith(emailTouched: true));
  }

  void markPasswordTouched() {
    emit((state as LoginFormState).copyWith(passwordTouched: true));
  }

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void login() {
    print('Email: ${_emailController.value}');
    print('Password: ${_passwordController.value}');
  }
}
