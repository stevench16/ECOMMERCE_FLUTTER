import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/AdminProductCreateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminProductCreatePage extends StatefulWidget {
  const AdminProductCreatePage({super.key});

  @override
  State<AdminProductCreatePage> createState() =>
      _AdminProductCreatePageState();
}

class _AdminProductCreatePageState extends State<AdminProductCreatePage> {
  
  AdminProductCreateBloc? _bloc;
  Category? category;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      _bloc?.add(AdminProductCreateInitEvent(category: category));
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminProductCreateBloc>(context);

    //category = ModalRoute.of(context)?.settings.arguments as Category;
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Category) {
      category = args;
    } else {
      category = null; // O un valor por defecto
    }

    return Scaffold(
      body: BlocListener<AdminProductCreateBloc, AdminProductCreateState>(
          listener: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
          // context.read<AdminCategoryListBloc>().add(GetCategories());
          _bloc?.add(ResetForm());
          Fluttertoast.showToast(
              msg: 'El Producto se creó correctamente.',
              toastLength: Toast.LENGTH_LONG);
        } else if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        }
      }, child: BlocBuilder<AdminProductCreateBloc, AdminProductCreateState>(
        builder: (context, state) {
          return AdminProductCreateContent(_bloc, state);
        },
      )
    ),
  );
 }
}
