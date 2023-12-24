import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  const InputField({super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
       width: MediaQuery.of(context).size.width * 85,
       height: 55,
      child: TextFormField(
        controller: controller,
        validator: validator,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,

          suffixIcon: Icon(icon),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2,color: Colors.grey)
          ),


        ),
      ),
    );
  }
}
