import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UploadTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  UploadTextField({required this.controller, required this.hintText, this.keyboardType, this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
        child: TextField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      );
  }
}
