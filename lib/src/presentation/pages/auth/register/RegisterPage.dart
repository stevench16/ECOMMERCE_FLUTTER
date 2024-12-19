import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultTextfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: DefaultTextField(
                        label: 'Nombre', 
                        icon: Icons.person, 
                        onChange: (text){}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Apellido', 
                        icon: Icons.person, 
                        onChange: (text){}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Email', 
                        icon: Icons.email, 
                        onChange: (text){}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Telefono', 
                        icon: Icons.phone, 
                        onChange: (text){}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Contraseña', 
                        icon: Icons.lock, 
                        onChange: (text){}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Confirma la Contraseña', 
                        icon: Icons.lock_outline, 
                        onChange: (text){}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 65),
                      child: DefaultButton(
                        text: 'REGISTRARSE', 
                        onPressed:  () {}
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