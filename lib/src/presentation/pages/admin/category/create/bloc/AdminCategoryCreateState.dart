import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminCategoryCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  final GlobalKey<FormState>? formKey;
  final File? file;
  final Resource? response;

  const AdminCategoryCreateState(
      {this.name =
          const BlocFormItem(error: 'Ingrese el nombre de la categoría.'),
      this.description =
          const BlocFormItem(error: 'Ingrese la descripción de la categoría.'),
      this.formKey,
      this.response,
      this.file});

  toCategory() => Category(
        name: name.value,
        description: description.value,
      );

  AdminCategoryCreateState resetForm() {
    return AdminCategoryCreateState(
      name: const BlocFormItem(error: 'Ingrese el nombre de la categoría.'),
      description:
          const BlocFormItem(error: 'Ingrese la descripción de la categoría.'),
    );
  }

  AdminCategoryCreateState copyWith(
      {BlocFormItem? name,
      BlocFormItem? description,
      GlobalKey<FormState>? formKey,
      File? file,
      Resource? response}) {
    return AdminCategoryCreateState(
        name: name ?? this.name,
        description: description ?? this.description,
        file: file ?? this.file,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props => [name, description, file, response];
}
