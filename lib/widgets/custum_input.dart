import 'package:flutter/material.dart';

class CustumInput extends StatelessWidget {
  final TextEditingController controller;
  final String lableText;
  final String? Function(String?)? validator;
  const CustumInput({
    super.key,
    required this.controller,
    required this.lableText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
