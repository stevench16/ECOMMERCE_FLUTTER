import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/AdminProductCreateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/AdminProductUpdateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart' hide ResetForm;
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateState.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminProductUpdatePage extends StatefulWidget {
  const AdminProductUpdatePage({super.key});

  @override
  State<AdminProductUpdatePage> createState() =>
      _AdminProductUpdatePage();
}

class _AdminProductUpdatePage extends State<AdminProductUpdatePage> {
  
  AdminProductUpdateBloc? _bloc;
  Product? product;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      _bloc?.add(AdminProductUpdateInitEvent(product: product));
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminProductUpdateBloc>(context);
    product = ModalRoute.of(context)?.settings.arguments as Product;
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Product) {
      product = args;
    } else {
      product = null; // O un valor por defecto
    }
    return Scaffold(
      body: BlocListener<AdminProductUpdateBloc, AdminProductUpdateState>(
          listener: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
          // context.read<AdminCategoryListBloc>().add(GetCategories());
          // _bloc?.add(ResetForm() as AdminProductUpdateEvent);
          Fluttertoast.showToast(
              msg: 'El Producto se actualizo correctamente.',
              toastLength: Toast.LENGTH_LONG);
        } else if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        }
      }, child: BlocBuilder<AdminProductUpdateBloc, AdminProductUpdateState>(
        builder: (context, state) {
          return AdminProductUpdateContent(_bloc, state, product);
        },
      )
    ),
  );
 }
}
