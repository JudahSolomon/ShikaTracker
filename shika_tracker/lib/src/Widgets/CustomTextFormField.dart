import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final bool obscureText;
  // final InputType formKeyboardType;


  final FormFieldValidator<String> validator;

  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.labelText,
      required this.validator,
      required this.obscureText,
        // required this.formKeyboardType

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Form(
      key: _formKey,
      child: TextFormField(
        onChanged: (value) {
          _formKey.currentState?.validate();
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        // keyboardType: formKeyboardType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 14, color: Colors.blue),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }
}
