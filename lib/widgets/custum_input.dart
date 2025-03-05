import 'package:flutter/material.dart';
import 'package:study_planner_new/constants/colors.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: lableText,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: darkGreen),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
