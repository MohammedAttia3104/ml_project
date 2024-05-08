import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validate;
  final void Function(String)? textOnChanged;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textAction;
  final FocusNode? focusNode;
  bool? isObscured = false;

  CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validate,
      required this.textOnChanged,
      this.onEditingComplete,
      this.textAction,
      this.focusNode,
      this.isObscured});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            14.0.r,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            14.0.r,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(
            14.0.r,
          ),
        ),
        // hintText: hintText,
        label: Text(
          hintText,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        contentPadding: EdgeInsets.all(20.0.r),
      ),
      validator: validate,
      onChanged: textOnChanged,
      keyboardType: TextInputType.number,
      obscureText: isObscured ?? false,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      textInputAction: textAction,
    );
  }
}
