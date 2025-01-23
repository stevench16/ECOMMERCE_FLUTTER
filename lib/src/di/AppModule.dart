import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Appmodule {
  
  @injectable
  AuthService get authService => AuthService();
}
