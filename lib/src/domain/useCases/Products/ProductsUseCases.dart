import 'package:ecommerce_flutter/src/domain/useCases/Products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Products/UpdateProductUseCase.dart';

class ProductsUseCases {

  CreateProductUseCase create;
  GetProductsByCategoryUseCase getProductsByCategory;
  UpdarteProductUseCase update;

  ProductsUseCases({
    required this.create,
    required this.getProductsByCategory,
    required this.update,
  });
}