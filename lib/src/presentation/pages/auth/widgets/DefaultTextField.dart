import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  String? initialValue;
  String? errorText;
  TextInputType? keyboardType; // ✅ Debe llamarse keyboardType aquí
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
    this.obscureText = false,
    this.initialValue,
    this.color = Colors.white,
    this.keyboardType, // ✅ Y aquí también
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: (text) {
        onChange(text);
      },
      keyboardType: keyboardType, // ✅ Esto está bien
      validator: validator,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: color),
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
      style: TextStyle(color: color),
    );
  }
}
