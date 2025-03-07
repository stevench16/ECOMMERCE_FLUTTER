import 'package:ecommerce_flutter/src/domain/useCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/DeleteCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/GetCategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/UpdateCategoryUseCase.dart';

class CategoriesUseCases{
  CreateCategoryUseCase create;
  GetCategoriesUseCases getCategories;
  UpdateCategoryUseCase update;
  DeleteCategoryUseCase delete;

  CategoriesUseCases({
    required this.create,
    required this.getCategories,
    required this.update,
    required this.delete,
  });
}