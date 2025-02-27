import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoriesService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UsersService.dart';
import 'package:ecommerce_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/UsersRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LogoutUSeCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  
  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  AuthService get authService => AuthService();

  @injectable
  UsersService get usersService => UsersService(sharedPref);

  @injectable
  CategoriesService get categoriesService => CategoriesService(sharedPref);

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharedPref);

  @injectable
  UsersRepositoryImpl get usersRepository => UsersRepositoryImpl(usersService);
  
  @injectable
  CategoriesRepository get categoriesRepository => CategoriesRepositoryImpl(categoriesService);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      saveUserSession: SaveUserSessionUseCase(authRepository),
      getUSerSession: GetUserSessionUseCase(authRepository),
      logout: LogoutUseCase(authRepository)
  );

  @injectable
  UsersUseCases get usersUseCases => UsersUseCases(
    updateUser: UpdateUserUseCase(usersRepository as UsersRepository)
  );


  @injectable

  CategoriesUseCases get categoriesUseCases => CategoriesUseCases(
    create: CreateCategoryUseCase(categoriesRepository));

}
