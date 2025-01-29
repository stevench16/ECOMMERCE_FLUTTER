import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginResponse.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  LoginBloc? _bloc;

  @override
  void initState() {
    // Ejecuta una sola vez cuando carga la pantalla
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //  _loginBlocCubit?.dispose();
    //});
  }

  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, 
                toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Success) {
            Fluttertoast.showToast(
                msg: 'Login exitoso', 
                toastLength: Toast.LENGTH_LONG
                );
      }
  },
  child: BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return LoginContent(_bloc, state);
    })
  ),
      // child: Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     LoginResponse(_bloc),
      //     LoginContent(_bloc),
      //   ],
      // ),
    )
    );
  }
}
