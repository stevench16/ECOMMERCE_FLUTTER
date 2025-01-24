import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:injectable/injectable.dart';


class AuthUseCases {

  LoginUseCase login;

  AuthUseCases({
    required this.login,
  });

}