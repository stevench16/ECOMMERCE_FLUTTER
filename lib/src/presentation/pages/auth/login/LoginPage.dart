import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                color: Colors.black,
                size: 125,
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Correo Electrónico')
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Contraseña')
                ),
            ],
          ),
        )
    );
  }
}