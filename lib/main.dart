import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/src/blocProviders.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/AdminCategoryCreatePAge.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/AdminCategoryUpdatePage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/AdminHomePage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/ClientAddressCreatePage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/ClientAddressListPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/ProfileUpdatePage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: 'login',
      routes: { 
         'login': (BuildContext context) => LoginPage(),
         'register': (BuildContext context) => RegisterPage(),
         'roles': (BuildContext context) => RolesPage(),
         'profile/info': (BuildContext context) => ProfileInfoPage(),
         'profile/update': (BuildContext context) => ProfileUpdatePage(),
         'client/home': (BuildContext context) => ClientHomePage(),
         'admin/home': (BuildContext context) => AdminHomePage(),
         'admin/category/create':(BuildContext context) => AdminCategoryCreatePage(),
         'admin/category/update':(BuildContext context) => AdminCategoryUpdatePage(),
         'client/address/list':(BuildContext context) => ClientAddressListPage(),
         'client/address/create':(BuildContext context) => ClientAddressCreatePage(),


        },
      ),
    );
  }
}