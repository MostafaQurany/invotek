import 'package:flutter/material.dart';

class AuthTextFiled extends StatefulWidget {
  final FocusNode? focusNode;
  final String hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isPassword;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  const AuthTextFiled({
    super.key,
    required this.controller,
    required this.hint,
    required this.keyboardType,
    required this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.obscureText = false,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<AuthTextFiled> createState() => _AuthTextFiledState();
}

class _AuthTextFiledState extends State<AuthTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        validator: widget.validator,

        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
