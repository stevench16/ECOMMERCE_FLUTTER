import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/AdminCategoryCreateContent.dart';
import 'package:flutter/material.dart';

class AdminCategoryCreatePage extends StatefulWidget {
  const AdminCategoryCreatePage({super.key});

  @override
  State<AdminCategoryCreatePage> createState() => _AdminCategoryCreatePageState();
}

class _AdminCategoryCreatePageState extends State<AdminCategoryCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminCategoryCreateContent(),
    );
  }
}
