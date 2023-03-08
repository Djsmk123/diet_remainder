import 'package:flutter/material.dart';

class CustomTextFieldRegister extends StatelessWidget {
  final String hintText;
  final Function(String?)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String?)? onSubmitted;
  final Widget? suffixIcon;

  const CustomTextFieldRegister({Key? key, required this.hintText, this.onChanged, this.validator, this.controller, this.keyboardType, this.onSubmitted, this.suffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: (value){
        //unfocused the keyboard
        FocusScope.of(context).unfocus();
        onSubmitted!(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
