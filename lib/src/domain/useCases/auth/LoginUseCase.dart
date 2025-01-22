import 'package:ecommerce_flutter/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';

class LoginUseCase {
  
  Authrepositoryimpl authRepository = Authrepositoryimpl();

  run(String email, String password) => authRepository.login(email, password);

}