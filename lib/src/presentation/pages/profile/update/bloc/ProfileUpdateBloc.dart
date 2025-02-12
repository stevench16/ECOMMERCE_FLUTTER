import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState>{

    final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc(): super(ProfileUpdateState()){
    on<ProfileUpdateInitEvent>(_onInitEvent);
    on<ProfileUpdateNameChanged>(_onNameChanged);
    on<ProfileUpdateLastnameChanged>(_onLastnameChanged);
    on<ProfileUpdatePhoneChanged>(_onPhoneChanged);
  }

    Future<void> _onInitEvent(ProfileUpdateInitEvent event, Emitter<ProfileUpdateState> emit) async {
    emit(
      state.copyWith(
        formKey: formKey
      )
    );
  }

  Future<void> _onNameChanged(ProfileUpdateNameChanged event, Emitter<ProfileUpdateState> emit) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre'
        ),
        formKey: formKey
      )
    );
  }

  Future<void> _onLastnameChanged(ProfileUpdateLastnameChanged event, Emitter<ProfileUpdateState> emit) async {
    emit(
      state.copyWith(
        lastname: BlocFormItem(
          value: event.lastname.value,
          error: event.lastname.value.isNotEmpty ? null : 'Ingresa el Apellido'
        ),
        formKey: formKey
      )
    );
  }

  Future<void> _onPhoneChanged(ProfileUpdatePhoneChanged event, Emitter<ProfileUpdateState> emit) async {
    emit(
      state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isNotEmpty ? null : 'Ingresa el Telefono'
        ),
        formKey: formKey
      )
    );
  }



}