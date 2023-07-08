import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_textfieal_controller.dart';
import '../utility/colors.dart';

class MyTextField extends StatefulWidget {

  final TextEditingController? controller;
  String? hintText;
  final IconData? icon;
  bool? passwordIcon;

  MyTextField(
      {super.key, required this.controller, this.hintText, required this.icon, this.passwordIcon});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

bool hidden = false;

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTextFieldController>(
      init: MyTextFieldController(),
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.only(left: 5, right: 10),
            margin: const EdgeInsets.only(top: 20),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: bgColor,
            ),
            child: Center(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: widget.controller!,
                  obscureText: widget.passwordIcon != null ? !controller
                      .hidden : false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText!,
                    hintStyle: const TextStyle(
                      fontSize: 16, color: Colors.grey,),
                    suffixIcon: widget.passwordIcon == true ? IconButton(
                      onPressed: controller
                          .passwordHidden,
                      icon: Icon(
                        hidden ? Icons.visibility_off : Icons.visibility,
                        size: 20, color: Colors.grey.shade300,),
                    ) : null,
                    prefixIcon: Icon(
                      widget.icon!, size: 20, color: Colors.grey.shade300,),
                  ),
                )
            ),
          );
        });
  }
}
