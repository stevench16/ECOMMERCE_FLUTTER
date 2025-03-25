import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';



abstract class AdminProductUpdateEvent extends Equatable{
  const AdminProductUpdateEvent();
  @override
  List<Object?> get props => [];

}

class AdminProductUpdateInitEvent extends AdminProductUpdateEvent{
  final Product? product;
  const AdminProductUpdateInitEvent({ required this.product });
  @override
  List<Object?> get props => [product];
}

class AdminProductCreateNameChanged extends AdminProductUpdateEvent{
  final BlocFormItem name;
  const AdminProductCreateNameChanged ({required this.name});
  @override
  List<Object?> get props => [name];
}

class AdminProductCreateDescriptionChanged extends AdminProductUpdateEvent{
  final BlocFormItem description;
  const AdminProductCreateDescriptionChanged ({required this.description});
  @override
  List<Object?> get props => [description];
}

class AdminProductCreatePriceChanged extends AdminProductUpdateEvent{
  final BlocFormItem price;
  const AdminProductCreatePriceChanged ({required this.price});
  @override
  List<Object?> get props => [price];
}

class FormSubmit extends AdminProductUpdateEvent{
  const FormSubmit();
  @override
  List<Object?> get props => [];
}
class PickImage extends AdminProductUpdateEvent{
  final int numberFile;
  const PickImage ({required this.numberFile});
}

class TakePhoto extends AdminProductUpdateEvent{
  final int numberFile;
  const TakePhoto ({required this.numberFile});
}

class ResetForm extends AdminProductUpdateEvent{
  const ResetForm();
  @override
  List<Object?> get props =>[];
}