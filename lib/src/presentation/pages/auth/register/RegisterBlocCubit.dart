import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState>{

  RegisterBlocCubit(): super(RegisterInitial());

final _nameController = BehaviorSubject<String>();
final _lastnameController = BehaviorSubject<String>();
final _emailController = BehaviorSubject<String>();
final _phoneController = BehaviorSubject<String>();
final _passwordController = BehaviorSubject<String>();
final _confirmpasswordController = BehaviorSubject<String>();

Stream<String> get nameStream => _nameController.stream;
Stream<String> get lastnameStream => _lastnameController.stream;


}