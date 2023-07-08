// import 'package:flutter/material.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:lottie/lottie.dart';
// import 'package:untitled2/pages/sign_up.dart';
// import '../component/my_text_field.dart';
// import '../model/user_model.dart';
// import '../services/network_service.dart';
// import '../utility/colors.dart';
// import 'main_screen.dart';
//
// class SignIn extends StatefulWidget {
//   const SignIn({super.key});
//
//   static String get id => "sign_in";
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   final gmailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   _doSignUp() async {
//     String gmail = gmailController.text.toString().trim();
//     String password = passwordController.text.toString().trim();
//
//     if (gmail.isEmpty || password.isEmpty) return;
//
//     var member = UserModel(email: gmail, password: password);
//
//     await NetworkService.POST(
//         NetworkService.API_SIGNIN, NetworkService.paramsSing(member))
//         .then((data) => getValue(data!));
//   }
//
//   void getValue(dynamic data) {
//     if(data != null){
//       print(data);
//       setState(() {
//         Navigator.pushReplacementNamed(context, MainScreen.id);
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//             constraints: const BoxConstraints(
//               minWidth: 750,
//               maxWidth: 800,
//             ),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25),
//               color: secondaryColor,
//             ),
//             height: 500,
//             width: 800,
//             child: Row(
//               children: [
//                 /* Animation part */
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     // color: Colors.red,
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(25),
//                             bottomLeft: Radius.circular(25)),
//                         gradient: LinearGradient(
//                             begin: Alignment.bottomLeft,
//                             end: Alignment.topRight,
//                             colors: [
//                               Color(0xFF24c6dc),
//                               Color(0xFF514a9d),
//                             ])),
//                     child: Lottie.asset('assets/animation/signUp.json',
//                         height: 600),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(defaultPadding * 2),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         MyTextField(
//                             controller: gmailController,
//                             icon: Icons.email_outlined,
//                             hintText: "Gmail"),
//                         MyTextField(
//                             controller: passwordController,
//                             icon: Bootstrap.key,
//                             hintText: "Password",
//                             passwordIcon: true),
//                         const SizedBox(
//                           height: 20,
//                         ),
//
//                         /* Click Sing In page */
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Text(
//                               "Don't have an account?",
//                               style:
//                                   TextStyle(fontSize: 16, color: Colors.grey),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pushReplacementNamed(
//                                     context, SignUp.id);
//                               },
//                               child: const Text(
//                                 "Sign Up",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w700,
//                                     color: primaryColor),
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//
//                         /* Button */
//                         GestureDetector(
//                           onTap: () {
//                             _doSignUp();
//                             // FileService().uploadImage();
//                             // currantDate();
//                             // _doSignUp();
//                             // ShowMassage.isEmptyMassage(context, "isEmpty");
//                           },
//                           child: Container(
//                             height: 45,
//                             width: 150,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 gradient: const LinearGradient(
//                                     begin: Alignment.bottomLeft,
//                                     end: Alignment.topRight,
//                                     colors: [
//                                       Color(0xFF24c6dc),
//                                       Color(0xFF514a9d),
//                                     ])),
//                             child: const Center(
//                               child: Text(
//                                 "Sign In",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }
