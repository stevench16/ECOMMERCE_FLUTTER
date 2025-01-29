import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class InitEvent extends LoginEvent {
  const InitEvent();
}

class LoginFormReset extends LoginEvent {
  const LoginFormReset();
}
class EmailChanged extends LoginEvent {
  final BlocFormItem email;
  const EmailChanged({ required this.email });
  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final BlocFormItem password;
  const PasswordChanged({ required this.password });
  @override
  List<Object?> get props => [password];
}

class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}