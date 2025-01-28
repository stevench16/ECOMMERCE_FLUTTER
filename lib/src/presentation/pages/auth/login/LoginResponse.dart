import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginResponse extends StatelessWidget {

  LoginBloc? bloc;
  
  LoginResponse(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc?.responseStream,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state is Loading){
            return Center(child: CircularProgressIndicator(color: Colors.black));
          }
          else if (state is Error) {
            Fluttertoast.showToast(
                msg: state.message, toastLength: Toast.LENGTH_LONG);
          } else if (state is Success) {
            Fluttertoast.showToast(
                msg: 'Login exitoso', 
                toastLength: Toast.LENGTH_LONG
                );
          }
          return Container();
        }
        );
  }
}
