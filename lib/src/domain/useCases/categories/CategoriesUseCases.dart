import 'package:ecommerce_flutter/src/domain/useCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/GetCategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/UpdateCategoryUseCase.dart';

class CategoriesUseCases{
  CreateCategoryUseCase create;
  GetCategoriesUseCases getCategories;
  UpdateCategoryCase update;

  CategoriesUseCases({
    required this.create,
    required this.getCategories,
    required this.update,
  });
}