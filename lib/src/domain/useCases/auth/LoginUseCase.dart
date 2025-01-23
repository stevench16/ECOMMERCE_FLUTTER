import 'package:ecommerce_flutter/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
class LoginUseCase {
  
  AuthRepositoryImpl authRepository = AuthRepositoryImpl();

  LoginUseCase(authRepository);

  run(String email, String password) => authRepository.login(email, password);

}