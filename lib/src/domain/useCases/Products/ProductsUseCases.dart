import 'package:ecommerce_flutter/src/domain/useCases/Products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Products/GetProductsByCategoryUseCase.dart';

class ProductsUseCases {

  CreateProductUseCase create;
  GetProductsByCategoryUseCase getProductsByCategory;

  ProductsUseCases({
    required this.create,
    required this.getProductsByCategory
  });
}