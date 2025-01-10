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
Stream<String> get emailStream => _emailController.stream;
Stream<String> get phoneStream => _phoneController.stream;
Stream<String> get passwordStream => _passwordController.stream;
Stream<String> get confirmpasswordStream => _confirmpasswordController.stream;

Stream<bool> get validateForm => Rx.combineLatest6(
  nameStream,
  lastnameStream, 
  emailStream, 
  phoneStream, 
  passwordStream, 
  confirmpasswordStream, (a, b, c, d, e, f) => true
  );

  void register(){
    print('Name: ${_nameController.value}');
    print('Lastname: ${_lastnameController.value}');
    print('Email: ${_emailController.value}');
    print('Phone: ${_phoneController.value}');
    print('Password: ${_passwordController.value}');
    print('Confirm Password: ${_confirmpasswordController.value}');

  }

void changeName(String name){
  if (name.length < 2){
    _nameController.sink.addError('El nombre es muy corto');
  }
  else {
    _nameController.sink.add(name);
  }
}

void changeLastName(String lastname){
  if (lastname.length < 2){
    _lastnameController.sink.addError('El apellido es muy corto');
  }
  else {
    _lastnameController.sink.add(lastname);
  }
}

void changeEmail(String email) {
    bool emailFormatValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
    if (email.isNotEmpty && email.length < 5) {
      _emailController.sink.addError('Al menos 5 caracteres');
    }
    else if(email.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError('El email no es valido');
    }
    else {
      _emailController.sink.add(email);
    }
  }

void changePhone(String phone){
  if (phone.length < 8){
    _phoneController.sink.addError('No es un numero de telefono valido');
  }
  else {
    _phoneController.sink.add(phone);
  }
}

void changePassword(String password){
  if (password.length < 6){
    _passwordController.sink.addError('Al menos 6 caracteres');
  }
  else {
    _passwordController.sink.add(password);
  }
}

void changeConfirmPassword(String confirmPassword){
  if (confirmPassword.length < 6){
    _confirmpasswordController.sink.addError('Al menos 6 caracteres');
  }
  else if (confirmPassword != _passwordController.value){
    _confirmpasswordController.sink.addError('Las contraseñas no coinciden');
  }
  else {
    _confirmpasswordController.sink.add(confirmPassword);
  }
}

void dispose(){
  changeName('');
  changeLastName('');
  changeEmail('');
  changePhone('');
  changePassword('');
  changeConfirmPassword('');
}

}