import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {

String label;
String? initialValue;
String? errorText;
IconData icon;
Color? color;
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
    this.obscureText=false, 
    this.initialValue,
    this.color = Colors.white   
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: (text){
        onChange(text);
      },
      validator: validator,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: color
            ),
        ),
        errorText: errorText,
        prefixIcon: Icon(
          icon,
          color: color,
        ),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color!)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color!)),
      ),
      style: TextStyle(
        color: color
      ),
    );
  }
}
