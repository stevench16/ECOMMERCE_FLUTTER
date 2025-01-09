import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  LoginBlocCubit() : super(LoginInitial());

  final _emailController = BehaviorSubject<String>.seeded('');
  final _passwordController = BehaviorSubject<String>.seeded('');

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void changeEmail(String email) {
    if (email.length < 6) {
      _emailController.sink.addError('El email debe tener mas de 6 caracteres');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.length < 6) {
      _passwordController.sink
          .addError('El password debe tener mas de 6 caracteres');
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void dispose() {
    // Cuando pasemos a otra pantalla
    changeEmail('');
    changePassword('');
  }

  void login() {
    print('Email: ${_emailController.value}');
    print('Password: ${_passwordController.value}');
  }
}
