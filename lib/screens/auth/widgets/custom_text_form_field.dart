import 'package:flutter/material.dart';
import 'package:house_cleaning/utils/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.focusNode,
      required this.prefixIcon,
      required this.hintText,
      required this.labelText,
      required this.onChanged,
      required this.onFieldSubmitted,
      required this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.obsecureText = false});
  final bool obsecureText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final IconData prefixIcon;
  final String hintText;
  final String labelText;
  final void Function(String) onChanged;
  final void Function(String) onFieldSubmitted;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;

  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorManager.primaryColor,
            width: 2.0,
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: ColorManager.primaryColor,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: ColorManager.secondaryPrimaryColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primaryColor,
          ),
        ),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
