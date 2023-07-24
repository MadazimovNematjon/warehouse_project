import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse_project/component/auth_ui.dart';
import 'package:warehouse_project/controllers/sign_up_controller.dart';
import 'package:warehouse_project/pages/sign_in.dart';
import '../component/my_text_field.dart';
import '../utility/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static String get id => "sign_up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AuthUi(
            child: GetBuilder<SignUpController>(
                init: SignUpController(),
                builder: (controller) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(defaultPadding * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyTextField(
                              controller: controller.firstNameController,
                              icon: FontAwesome.user,
                              hintText: "first name".tr),
                          MyTextField(
                              controller: controller.lastNameController,
                              icon: FontAwesome.user,
                              hintText: "last name".tr),
                          MyTextField(
                              controller: controller.gmailController,
                              icon: Icons.email_outlined,
                              hintText: "email:".tr ),
                          MyTextField(
                              controller: controller.passwordController,
                              icon: Bootstrap.key,
                              hintText: "password".tr,
                              passwordIcon: true),
                          MyTextField(
                              controller: controller.againPasswordController,
                              icon: Bootstrap.key,
                              hintText: "again password".tr,
                              passwordIcon: true),


                          const SizedBox(height: 20,),

                          /* Click Sing In page */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               Text("do you have an account ?".tr,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.grey),),
                              TextButton(onPressed: () {
                                Get.off(const SignIn());
                              },
                                child:  Text("sign in".tr, style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor),),
                              )
                            ],
                          ),

                          const SizedBox(height: 15,),

                          /* Button */
                          GestureDetector(
                            onTap: controller.doSignUp,
                            child: Container(
                              height: 45,
                              // width: 150,
                              margin: EdgeInsets.only(left: 50,right: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Color(0xFF24c6dc),
                                        Color(0xFF514a9d),
                                      ]
                                  )
                              ),
                              child:  Center(
                                child: Text('sign up'.tr, style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ),
    );
  }
}
