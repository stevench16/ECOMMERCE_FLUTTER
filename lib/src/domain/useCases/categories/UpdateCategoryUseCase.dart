import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart';

class UpdateCategoryCase {
  CategoriesRepository categoriesRepository;
  UpdateCategoryCase(this.categoriesRepository);
  run(int id, Category category , File? file) => categoriesRepository.update(id, category, file);


}