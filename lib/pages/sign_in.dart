import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:warehouse_project/component/auth_ui.dart';
import 'package:warehouse_project/controllers/sign_in_controller.dart';
import 'package:warehouse_project/pages/sign_up.dart';
import '../component/my_text_field.dart';
import '../utility/colors.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static String get id => "sign_in";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: AuthUi(
            child: GetBuilder<SignInController>(
                init: SignInController(),
                builder: (controller) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(defaultPadding * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyTextField(
                              controller: controller.gmailController,
                              icon: Icons.email_outlined,
                              hintText: "Gmail"),
                          MyTextField(
                              controller: controller.passwordController,
                              icon: Bootstrap.key,
                              hintText: "Password",
                              passwordIcon: true),
                          const SizedBox(
                            height: 20,
                          ),

/* Click Sing In page */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style:
                                TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.off(const SignUp());
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: primaryColor),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),

/* Button */
                          GestureDetector(
                            onTap: controller.doSignIn,
                            child: Container(
                              height: 45,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Color(0xFF24c6dc),
                                        Color(0xFF514a9d),
                                      ])),
                              child: const Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
      ),
    );
  }
}
