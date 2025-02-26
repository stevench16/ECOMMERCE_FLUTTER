import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class AdminCategoryCreateEvent extends Equatable{
  const AdminCategoryCreateEvent();
  @override
  List<Object?> get props => [];

}

class AdminCategoryCreateInitEvent extends AdminCategoryCreateEvent{
  const AdminCategoryCreateInitEvent();
  @override
  List<Object?> get props => [];
}

class AdminCategoryCreateNameChanged extends AdminCategoryCreateEvent{
  final BlocFormItem name;
  const AdminCategoryCreateNameChanged ({required this.name});
  @override
  List<Object?> get props => [name];
}

class AdminCategoryCreateDescriptionChanged extends AdminCategoryCreateEvent{
  final BlocFormItem description;
  const AdminCategoryCreateDescriptionChanged ({required this.description});
  @override
  List<Object?> get props => [description];
}
class FormSubmit extends AdminCategoryCreateEvent{
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminCategoryCreateEvent{
  const ResetForm();
  @override
  List<Object?> get props =>[];
}

class PickImage extends AdminCategoryCreateEvent{
  const PickImage ();
}

class TakePhoto extends AdminCategoryCreateEvent{
  const TakePhoto ();
}