import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart';

class GetCategoriesUseCases {
  CategoriesRepository categoriesRepository;
  GetCategoriesUseCases(this.categoriesRepository);
  run() => categoriesRepository.getCategories();
}
