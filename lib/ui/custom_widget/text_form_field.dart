import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String titleText;
  Icon prefixIcon;
  FormFieldValidator<String>? validator;
  bool? obscureText;
  Widget? suffixIcon;
  TextEditingController? controller;

  CustomTextFormField({
    super.key,
    required this.titleText,
    required this.prefixIcon,
    this.validator,
    this.obscureText = false ?? true,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        focusColor: Color(0xff7B7B7B),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xff7B7B7B)),
        ),
        prefixIcon: prefixIcon,

        hint: Text(
          titleText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
