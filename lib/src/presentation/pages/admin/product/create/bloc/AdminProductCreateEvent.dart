import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';


abstract class AdminProductCreateEvent extends Equatable{
  const AdminProductCreateEvent();
  @override
  List<Object?> get props => [];

}

class AdminProductCreateInitEvent extends AdminProductCreateEvent{
  final Category? category;
  const AdminProductCreateInitEvent({ required this.category  });
  @override
  List<Object?> get props => [category];
}

class AdminProductCreateNameChanged extends AdminProductCreateEvent{
  final BlocFormItem name;
  const AdminProductCreateNameChanged ({required this.name});
  @override
  List<Object?> get props => [name];
}

class AdminProductCreateDescriptionChanged extends AdminProductCreateEvent{
  final BlocFormItem description;
  const AdminProductCreateDescriptionChanged ({required this.description});
  @override
  List<Object?> get props => [description];
}

class AdminProductCreatePriceChanged extends AdminProductCreateEvent{
  final BlocFormItem price;
  const AdminProductCreatePriceChanged ({required this.price});
  @override
  List<Object?> get props => [price];
}

class FormSubmit extends AdminProductCreateEvent{
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminProductCreateEvent{
  const ResetForm();
  @override
  List<Object?> get props =>[];
}

class PickImage extends AdminProductCreateEvent{
  final int numberFile;
  const PickImage ({required this.numberFile});
}

class TakePhoto extends AdminProductCreateEvent{
  final int numberFile;
  const TakePhoto ({required this.numberFile});
}