import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminProductCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final GlobalKey<FormState>? formKey;
  final File? file1;
  final File? file2;
  final Resource? response;

  const AdminProductCreateState(
      {this.name = const BlocFormItem(error: 'Ingrese el nombre de la categoría.'),
      this.description = const BlocFormItem(error: 'Ingrese la descripción de la categoría.'),
      this.price = const BlocFormItem(error: 'Ingrese el precio'),
      this.formKey,
      this.response,
      this.file1,
      this.file2
      });

  toCategory() => Category(
        name: name.value,
        description: description.value,
      );

  AdminProductCreateState resetForm() {
    return AdminProductCreateState(
      name: const BlocFormItem(error: 'Ingrese el nombre de la categoría.'),
      description:
          const BlocFormItem(error: 'Ingrese la descripción de la categoría.'),
    );
  }

  AdminProductCreateState copyWith(
      {BlocFormItem? name,
      BlocFormItem? description,
      BlocFormItem? price,
      GlobalKey<FormState>? formKey,
      File? file1,
      File? file2,
      Resource? response}) {
    return AdminProductCreateState(
        name: name ?? this.name,
        description: description ?? this.description,
        file1: file1 ?? this.file1,
        file2: file2 ?? this.file2,
        price: price ?? this.price,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props => [name, description, price, file1, file2, response];
}
