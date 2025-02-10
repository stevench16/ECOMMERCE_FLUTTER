import 'package:flutter/material.dart';

class AdminCategoryListState extends StatefulWidget {
  const AdminCategoryListState({super.key});

  @override
  State<AdminCategoryListState> createState() => _AdminCategoryListState();
}

class _AdminCategoryListState extends State<AdminCategoryListState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Admin Category List Page'),
      ),
    );
  }
}
