import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator; //? password and Confirm pasward
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return _errorMessage(hintText, context);
            }
            return null;
          },
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: _textInputType(hintText, context),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: _getBorderStyle(color: Colors.grey),
        enabledBorder: _getBorderStyle(color: Colors.grey),
        focusedBorder: _getBorderStyle(color: Colors.black12),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    );
  }
}

OutlineInputBorder _getBorderStyle({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color,
    ),
  );
}

TextInputType _textInputType(hintText, context) {
  if (hintText == 'Name') {
    return TextInputType.name;
  } else if (hintText == 'Email') {
    return TextInputType.emailAddress;
  } else if (hintText == 'Phone Number') {
    return TextInputType.phone;
  } else if (hintText == 'Password' || hintText == 'Confirm Password') {
    return TextInputType.visiblePassword;
  } else {
    return TextInputType.none;
  }
}

String _errorMessage(String hintText, context) {
  return '$hintText is empty!';
}
