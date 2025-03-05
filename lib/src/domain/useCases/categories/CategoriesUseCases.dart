import 'package:ecommerce_flutter/src/domain/useCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/GetCategoriesUseCases.dart';

class CategoriesUseCases{
  CreateCategoryUseCase create;
  GetCategoriesUseCases getCategories;
  CategoriesUseCases({
    required this.create,
    required this.getCategories,
  });
}