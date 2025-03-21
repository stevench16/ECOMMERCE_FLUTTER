import 'dart:io';
import 'package:ecommerce_flutter/src/domain/useCases/Products/ProductsUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateState.dart';

import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductUpdateBloc extends Bloc<AdminProductUpdateEvent, AdminProductUpdateState> {
  
  ProductsUseCases productsUseCases;

  AdminProductUpdateBloc(this.productsUseCases): super(AdminProductUpdateState()) {
    on<AdminProductUpdateInitEvent>(_onInitEvent);
    on<AdminProductCreateNameChanged>(_onAdminProductCreateNameChanged);
    on<AdminProductCreatePriceChanged>(_onAdminProductCreatePriceChanged);
    on<AdminProductCreateDescriptionChanged>(_onAdminProductCreateDescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(AdminProductUpdateInitEvent event, Emitter<AdminProductUpdateState> emit) async {
    emit(
      state.copyWith(
        id:event.product?.id,
        idCategory: event.product?.idCategory,
        name: BlocFormItem(value: event.product?.name ?? ''),
        description: BlocFormItem(value: event.product?.description ?? ''),
        price: BlocFormItem(value: event.product?.price.toString() ?? ''),
        formKey: formKey
      )
    );
  }

  Future<void> _onAdminProductCreateNameChanged(
      AdminProductCreateNameChanged event,
      Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty
                ? null
                : 'Ingrese el nombre de la Categoría'),
        formKey: formKey));
  }

    Future<void> _onAdminProductCreatePriceChanged(
      AdminProductCreatePriceChanged event,
      Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        price: BlocFormItem(
            value: event.price.value,
            error: event.price.value.isNotEmpty ? null: 'Ingrese el Precio'),
        formKey: formKey));
  }

  Future<void> _onAdminProductCreateDescriptionChanged(
      AdminProductCreateDescriptionChanged event,
      Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        description: BlocFormItem(
            value: event.description.value,
            error: event.description.value.isNotEmpty
                ? null
                : 'Ingrese la descripción de la Categoría'),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(
      FormSubmit event, Emitter<AdminProductUpdateState> emit) async {
    emit(
      state.copyWith(
        response: Loading(), 
        formKey: formKey
      )
    );    
    
    if(state.file1 != null && state.file2 != null){
      List<File> files= [state.file1!, state.file2!];
      Resource response = await productsUseCases.create.run(state.toProduct(), files);
        emit(
          state.copyWith(
            response: response, 
            formKey: formKey
          )
        );
    } else {
      emit(
          state.copyWith(
            response: Error('Selecciona las dos imagenes'), 
            formKey: formKey
          )
        );
    }
  }

  Future<void> _onResetForm(
      ResetForm event, Emitter<AdminProductUpdateState> emit) async {
    emit(state.resetForm());
    //state.formKey?.currentState?.reset();
  }

  Future<void> _onPickImage(
      PickImage event, Emitter<AdminProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (event.numberFile == 1) {
      emit(state.copyWith(
        file1: File(image.path), 
        formKey: formKey
        )
      );
    }
    else if (event.numberFile == 2) {
      emit(
        state.copyWith(
        file2: File(image.path), 
        formKey: formKey
        )
      );    
    }
  }
}

  Future<void> _onTakePhoto(
      TakePhoto event, Emitter<AdminProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (event.numberFile == 1) {
      emit(state.copyWith(
        file1: File(image.path), 
        formKey: formKey
        )
      );
    }
    else if (event.numberFile == 2) {
      emit(
        state.copyWith(
        file2: File(image.path), 
        formKey: formKey
        )
      );    
    }
    }
  }
}

extension on Category? {
  get id => null;
}
