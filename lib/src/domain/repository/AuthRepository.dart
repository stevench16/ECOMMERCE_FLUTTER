import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class AuthRepository {

  Future<Resource> login(String email, String password);
  Future<Resource> register(User user);

}