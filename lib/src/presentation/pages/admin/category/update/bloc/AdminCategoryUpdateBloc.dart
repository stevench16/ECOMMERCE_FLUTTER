import 'dart:io';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminCategoryUpdateBloc
    extends Bloc<AdminCategoryUpdateEvent, AdminCategoryUpdateState> {
  CategoriesUseCases categoriesUseCases;

  AdminCategoryUpdateBloc(this.categoriesUseCases)
      : super(AdminCategoryUpdateState()) {
    on<AdminCategoryUpdateInitEvent>(_onInitEvent);
    on<AdminCategoryUpdateNameChanged>(_onAdminCategoryUpdateNameChanged);
    on<AdminCategoryUpdateDescriptionChanged>(
        _onAdminCategoryUpdateDescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(AdminCategoryUpdateInitEvent event,
      Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.copyWith(
      id: event.category?.id,
      name: BlocFormItem(value: event.category?.name ?? ''),
      description: BlocFormItem(value: event.category?.description ?? ''),
      formKey: formKey));
  }

  Future<void> _onAdminCategoryUpdateNameChanged(
      AdminCategoryUpdateNameChanged event,
      Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty
                ? null
                : 'Ingrese el nombre de la Categoría'),
        formKey: formKey));
  }

  Future<void> _onAdminCategoryUpdateDescriptionChanged(
      AdminCategoryUpdateDescriptionChanged event,
      Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.copyWith(
        description: BlocFormItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'Ingrese la descripción de la Categoría'),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<AdminCategoryUpdateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response =
        await categoriesUseCases.create.run(state.toCategory(), state.file!);

    emit(state.copyWith(response: response, formKey: formKey));
  }
  
  Future<void> _onPickImage(
      PickImage event, Emitter<AdminCategoryUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onTakePhoto(
      TakePhoto event, Emitter<AdminCategoryUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }
}
