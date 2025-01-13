import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterBlocCubit? _registerBlocCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerBlocCubit?.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {

    _registerBlocCubit = BlocProvider.of<RegisterBlocCubit>(context, listen: false);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/img/background3.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Color.fromRGBO(0, 0, 0, 0.7),
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 100,
                    ),
                    Text(
                      'REGISTRO',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.nameStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Nombre', 
                            icon: Icons.person,
                            errorText: snapshot.error?.toString(), 
                            onChange: (text){
                              _registerBlocCubit?.changeName(text);
                            }
                            );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.lastnameStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Apellido', 
                            icon: Icons.person,
                            errorText: snapshot.error?.toString(), 
                            onChange: (text){
                              _registerBlocCubit?.changeLastName(text);
                            }
                            );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.emailStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Email', 
                            icon: Icons.email,
                            errorText: snapshot.error?.toString(), 
                            onChange: (text){
                              _registerBlocCubit?.changeEmail(text);
                            }
                            );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.phoneStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Telefono', 
                            icon: Icons.phone,
                            errorText: snapshot.error?.toString(), 
                            onChange: (text){
                              _registerBlocCubit?.changePhone(text);
                            }
                            );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.passwordStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Contraseña', 
                            icon: Icons.lock,
                            errorText: snapshot.error?.toString(), 
                            obscureText: true, 
                            onChange: (text){
                              _registerBlocCubit?.changePassword(text);
                            }
                            );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.confirmpasswordStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Confirma la Contraseña', 
                            icon: Icons.lock_outline,
                            errorText: snapshot.error?.toString(), 
                            obscureText: true,  
                            onChange: (text){
                              _registerBlocCubit?.changeConfirmPassword(text);
                            }
                            );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 65),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.validateForm,
                        builder: (context, snapshot) {
                          return DefaultButton(
                            text: 'REGISTRARSE', 
                            color: snapshot.hasData ? Colors.green : Colors.grey,
                            onPressed:  () {
                              if (snapshot.hasData){
                                _registerBlocCubit?.register();
                              }
                              else {
                                Fluttertoast.showToast(
                                  msg: 'El formulario no es valido',
                                  toastLength: Toast.LENGTH_LONG
                                  );
                              }
                            }
                            );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DefaultIconBack(
              left: 45, 
              top:15,
              ),
              Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 45, top:135),
              child: IconButton(
                onPressed: () { Navigator.pop(context); },
                icon: Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                      color: Colors.white
                )
                ),
            ),
          ],
        ),
      )
    );
  }
}