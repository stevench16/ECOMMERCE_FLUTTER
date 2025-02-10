import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminProductListPage extends StatefulWidget{
  const AdminProductListPage({super.key});

  @override
  State <AdminProductListPage> createState ()=> _AdminHomePageState();

}

class _AdminHomePageState extends State<AdminProductListPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('AdminProductListPage'),
      ),
    );
  }
}