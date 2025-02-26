import 'dart:io';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminCategoryCreateBloc
    extends Bloc<AdminCategoryCreateEvent, AdminCategoryCreateState> {
  AdminCategoryCreateBloc() : super(AdminCategoryCreateState()) {
    on<AdminCategoryCreateInitEvent>(_onInitEvent);
    on<AdminCategoryCreateNameChanged>(_onAdminCategoryCreateNameChanged);
    on<AdminCategoryCreateDescriptionChanged>(
        _onAdminCategoryCreateDescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(
      AdminCategoryCreateInitEvent event, Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onAdminCategoryCreateNameChanged(
      AdminCategoryCreateNameChanged event,
      Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty
                ? null
                : 'Ingrese el nombre de la Categoría'),
        formKey: formKey));
  }

  Future<void> _onAdminCategoryCreateDescriptionChanged(
      AdminCategoryCreateDescriptionChanged event,
      Emitter<AdminCategoryCreateState> emit) async {
    emit(state.copyWith(
        description: BlocFormItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'Ingrese la descripción de la Categoría'),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<AdminCategoryCreateState> emit) async {}
  Future<void> _onResetForm(
      ResetForm event, Emitter<AdminCategoryCreateState> emit) async {}

  Future<void> _onPickImage(
      PickImage event, Emitter<AdminCategoryCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onTakePhoto(
      TakePhoto event, Emitter<AdminCategoryCreateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }
}
