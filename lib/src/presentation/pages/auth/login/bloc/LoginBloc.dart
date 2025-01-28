import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  AuthUseCases authUseCases;

  LoginBloc(this.authUseCases) : super(LoginState()){
    on<InitEvent>(_onInitEvent);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmit>(_onLoginSubmit);
  } 
  
  final formKey = GlobalKey<FormState>();

  Future<void>_onInitEvent(InitEvent event, Emitter<LoginState> emit) async {
    emit( state.copywith( formKey: formKey));

  }

  Future<void> _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) async {
    emit(
      state.copywith(
        email: BlocFormItem(
          value: event.email.value
        ),
        formKey: formKey
      )
    );
  }

  Future<void> _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) async {
    emit(
      state.copywith(
        password: BlocFormItem(
          value: event.password.value
        ),
        formKey: formKey
      )
    );
  } 

  Future<void>_onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    _responseController.add(Loading());
    Resource response = await authUseCases.login.run(state.email.value, state.password.value);
    _responseController.add(response);
    Future.delayed(Duration(seconds: 1), () {
      _responseController.add(Initial());
    });
  }


  final _responseController = BehaviorSubject<Resource>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;

  // Stream<bool> get validateForm =>  Rx.combineLatest2(
  //   emailStream, passwordStream, (a, b) => true
  // );

  void changeEmail(String email) {
    if (email.isNotEmpty && email.length < 3) {
      _emailController.sink.addError('No es un E-mail válido');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _passwordController.sink
          .addError('La contraseña debe tener mas de 6 caracteres');
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void login() async {
    _responseController.add(Loading());
    Resource response = await authUseCases.login.run(_emailController.value, _passwordController.value);
    _responseController.add(response);
    Future.delayed(Duration(seconds: 1), () {
      _responseController.add(Initial());
    });
    print('Response: ${response}');
  }

  void dispose() {
    // Cuando pasemos a otra pantalla
    changeEmail('');
    changePassword('');
  }
}
