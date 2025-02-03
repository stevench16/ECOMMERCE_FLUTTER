import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {

String label;
String? errorText;
IconData icon;
Function(String text) onChange;
String? Function(String?)? validator;
bool obscureText;

  DefaultTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.onChange,
    this.errorText,
    this.validator,
    this.obscureText=false    
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: (text){
        onChange(text);
      },
      validator: validator,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white
            ),
        ),
        errorText: errorText,
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      style: TextStyle(
        color: Colors.white
      ),
    );
  }
}
