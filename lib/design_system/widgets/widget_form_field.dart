import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class WidgetFormField extends StatelessWidget {
  final String hint;
  final String value;
  final bool? obscure;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;

  const WidgetFormField({
    Key? key,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.onChanged, 
    required this.hint,
    required this.value,
    this.obscure,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return TextFormField(
        obscureText: obscure != null ? obscure! : false,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          filled: true,
          fillColor: colors.white,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
      );
    //);
  }
}
