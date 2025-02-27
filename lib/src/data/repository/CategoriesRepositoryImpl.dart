import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoriesService.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {

  CategoriesService categoriesService;
  CategoriesRepositoryImpl (this.categoriesService);
  @override
  Future<Resource<Category>> create(Category category, File file) {
    return categoriesService.create(category, file);
  }

}