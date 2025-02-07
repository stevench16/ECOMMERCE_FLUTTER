import 'package:ecommerce_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  SaveUserSessionUseCase saveUserSession;
  GetUserSessionUseCase getUSerSession;

  AuthUseCases(
      {required this.login,
      required this.register,
      required this.saveUserSession,
      required this.getUSerSession});
}
