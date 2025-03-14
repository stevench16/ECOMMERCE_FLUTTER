import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>(); // La clave del formulario

  RegisterBloc? _bloc;

  @override
  void initState() {
    super.initState();
      // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //   _bloc?.dispose();
      // });
  }

  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state){
            final responseState = state.response;
            if (responseState is Error) {
              Fluttertoast.showToast(
                msg: responseState.message, 
                toastLength: Toast.LENGTH_LONG
              );
            }
            else if (responseState is Success) {
              _formKey.currentState?.reset(); // Resetea el formulario correctamente
              _bloc?.add(RegisterFormReset());
              Fluttertoast.showToast(
                msg: 'Registro exitoso',
                toastLength: Toast.LENGTH_LONG
              );
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state){
              final responseState = state.response;
              if (responseState is Loading){
                return Center(child: CircularProgressIndicator());
              }
              return RegisterContent(_bloc, state, _formKey);
            }
          )
        )
      )
    );
  }
}