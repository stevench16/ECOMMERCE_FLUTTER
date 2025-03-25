import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminProductUpdateState extends Equatable {
  
  final int id;
  final int idCategory;
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final List<int>? imagesToUpdate;
  final GlobalKey<FormState>? formKey;
  final File? file1;
  final File? file2;
  final Resource? response;

  AdminProductUpdateState({

      this.id = 0,
      this.name = const BlocFormItem(error: 'Ingrese el nombre de la categoría.'),
      this.description = const BlocFormItem(error: 'Ingrese la descripción de la categoría.'),
      this.price = const BlocFormItem(error: 'Ingrese el precio'),
      this.idCategory = 0,
      this.formKey,
      this.response,
      this.file1,
      this.file2,
      this.imagesToUpdate,
  });

   /// Getter to return a list of selected images
  List<File> get files => [if (file1 != null) file1!, if (file2 != null) file2!];

  toProduct() => Product(

        id: id,
        name: name.value,
        description: description.value,
        price: double.parse(price.value),
        idCategory: idCategory, 
      );

  AdminProductUpdateState resetForm() {
    return AdminProductUpdateState(
      file1: null,
      file2: null,
    );
  }

  AdminProductUpdateState copyWith({
      int? id,
      int? idCategory,
      BlocFormItem? name,
      BlocFormItem? description,
      BlocFormItem? price,
      GlobalKey<FormState>? formKey,
      File? file1,
      File? file2,
      Resource? response,
      List<int>? imagesToUpdate
      }) {
    return AdminProductUpdateState(
        id: id ?? this.id,
        idCategory: idCategory ?? this.idCategory,
        name: name ?? this.name,
        description: description ?? this.description,
        file1: file1 ?? this.file1,
        file2: file2 ?? this.file2,
        price: price ?? this.price,
        formKey: formKey,
        response: response,
        imagesToUpdate: imagesToUpdate ?? this.imagesToUpdate
      );
  }

  @override
  List<Object?> get props => [idCategory, name, description, price, file1, file2, response];

}
