import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  AuthUseCases authUseCases;  

  RegisterBloc(this.authUseCases): super(RegisterState()) {
    on<RegisterInitEvent>(_onInitEvent);
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterLastnameChanged>(_onLastnameChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterFormSubmit>(_onFormSubmit);  
    on<RegisterFormReset>(_onFormReset);  
    
  }

  final formKey = GlobalKey<FormState>();

    Future<void>_onInitEvent(RegisterInitEvent event, Emitter<RegisterState> emit) async {
      emit( state.copywith( formKey: formKey));
  }

  Future<void>_onNameChanged(RegisterNameChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copywith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Ingresa el Nombre'
        ),
        formKey: formKey
      )
    );
  }
  Future<void>_onLastnameChanged(RegisterLastnameChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copywith(
        lastname: BlocFormItem(
          value: event.lastname.value,
          error: event.lastname.value.isNotEmpty ? null : 'Ingresa el Apellido'
        ),
        formKey: formKey
      )
    );
  }
  Future<void>_onPhoneChanged(RegisterPhoneChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copywith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isNotEmpty ? null : 'Ingresa el número de telefono'
        ),
        formKey: formKey
      )
    );
  }
  Future<void>_onConfirmPasswordChanged(RegisterConfirmPasswordChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copywith(
        confirmPassword: BlocFormItem(
          value: event.confirmpassword.value,
          error: event.confirmpassword.value.isNotEmpty ? null : 'Confirma el Password'
        ),
        formKey: formKey
      )
    );
  }



  Future<void> _onEmailChanged(RegisterEmailChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copywith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isNotEmpty ? null : 'Ingresa el email'
        ),
        formKey: formKey
      )
    );
  }

  Future<void> _onPasswordChanged(RegisterPasswordChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copywith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isNotEmpty && event.password.value.length >= 6 ? null : 'Ingresa el password'
        ),
        formKey: formKey
      )
    );
  } 

  Future<void>_onFormSubmit(RegisterFormSubmit event, Emitter<RegisterState> emit) async {
    emit( 
      state.copywith( 
        response: Loading(),
        formKey: formKey
      ),
      );
    Resource response = await authUseCases.register.run(state.toUser());
    emit ( 
      state.copywith( 
        response: response,
        formKey: formKey
        )
      );
  }
  Future<void>_onFormReset(RegisterFormReset event, Emitter<RegisterState> emit) async {
 //   state.formKey?.currentState?.reset();
//    emit(RegisterState(formKey: state.formKey));
    emit(state.copywith(
    response: null,  // Limpia la respuesta para evitar que se dispare otra vez el BlocListener
    name: BlocFormItem(value: ""),
    lastname: BlocFormItem(value: ""),
    email: BlocFormItem(value: ""),
    phone: BlocFormItem(value: ""),
    password: BlocFormItem(value: ""),
    confirmPassword: BlocFormItem(value: ""),
    formKey: state.formKey, // Mantiene la clave del formulario
  ));
  }

}