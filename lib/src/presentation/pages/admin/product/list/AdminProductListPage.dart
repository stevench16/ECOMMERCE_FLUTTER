import 'package:ecommerce_flutter/src/domain/models/Category.dart';

import 'package:flutter/material.dart';

class AdminProductListPage extends StatefulWidget{
  const AdminProductListPage({super.key});

  @override
  State <AdminProductListPage> createState ()=> _AdminProductListPage();

}
class _AdminProductListPage extends State<AdminProductListPage>{

  Category? category;

  @override
  Widget build(BuildContext context){
    //category = ModalRoute.of(context)?.settings.arguments as Category;
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Category) {
        category = args;
      } else {
        category = null; // O un valor por defecto
      }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'admin/product/create', arguments: category);
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      body: Center(
        child: Text('AdminProductListPage'),
      ),
    );
  }
}