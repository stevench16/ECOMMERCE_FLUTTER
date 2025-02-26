import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/AdminCategoryCreateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategoryCreatePage extends StatefulWidget {
  const AdminCategoryCreatePage({super.key});

  @override
  State<AdminCategoryCreatePage> createState() => _AdminCategoryCreatePageState();
}

class _AdminCategoryCreatePageState extends State<AdminCategoryCreatePage> {

  AdminCategoryCreateBloc? _bloc;

  
  @override
  Widget build(BuildContext context) {
    _bloc=BlocProvider.of<AdminCategoryCreateBloc>(context);
    return Scaffold(
      body: BlocBuilder<AdminCategoryCreateBloc, AdminCategoryCreateState>(
        builder: (context, state) {
          return AdminCategoryCreateContent(_bloc,state);
        }
      ),
    );
  }
}
