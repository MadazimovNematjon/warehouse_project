//
//
// import 'package:flutter/material.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:lottie/lottie.dart';
// import 'package:untitled2/pages/sign_in.dart';
//
// import '../component/my_text_field.dart';
// import '../model/user_model.dart';
// import '../services/network_service.dart';
// import '../services/save_secure_storage.dart';
// import '../utility/colors.dart';
// import '../utility/utils_service.dart';
// import 'main_screen.dart';
//
//
// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//
//   static String get id => "sign_up";
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//
//
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final gmailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final againPasswordController = TextEditingController();
//
//
//
//   _doSignUp() async{
//
//     String firstName = firstNameController.text.toString().trim();
//     String lastName = lastNameController.text.toString().trim();
//     String gmail = gmailController.text.toString().trim();
//     String password = passwordController.text.toString().trim();
//     String aPassword = againPasswordController.text.toString().trim();
//
//     if(firstName.isEmpty || lastName.isEmpty || gmail.isEmpty || password.isEmpty) return ;
//     if(password != aPassword) return;
//
//     var user = UserModel(name: firstName,surname: lastName,email: gmail,password: password,createdDate: UtilsService.currantDate().toString());
//
//     await NetworkService.POST(NetworkService.API_SIGNUP, NetworkService.paramsCreate(user)).then((dynamic data) {
//       if (data is String) {
//         // Handle the response as a plain string
//         dataSave(data);
//       } else {
//         // Handle the case when the data is not in the expected format
//         print('Error: Data is not a String');
//       }
//     });
//
//   }
//
//   dataSave(String data){
//     SecureStorage.saveData({'response': data});// Storing the string in a map with a key 'response'
//     setState(() {
//       Navigator.pushReplacementNamed(context, MainScreen.id);
//     });
//
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           constraints: const BoxConstraints(
//             minWidth: 750,
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
//                     padding: const EdgeInsets.only(left: 20,right: 20),
//                     // color: Colors.red,
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
//                         gradient: LinearGradient(
//                             begin: Alignment.bottomLeft,
//                             end: Alignment.topRight,
//                             colors: [
//                               Color(0xFF24c6dc),
//                               Color(0xFF514a9d),
//
//                             ]
//                         )
//                     ),
//                     child: Lottie.asset('assets/animation/signUp.json',height: 600),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(defaultPadding * 2),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         MyTextField(
//                             controller: firstNameController,
//                             icon: FontAwesome.user,
//                             hintText: "First Name"),
//                         MyTextField(
//                             controller: lastNameController,
//                             icon: FontAwesome.user,
//                             hintText: "Last Name"),
//                         MyTextField(
//                             controller: gmailController,
//                             icon: Icons.email_outlined,
//                             hintText: "Gmail"),
//                         MyTextField(
//                             controller: passwordController,
//                             icon: Bootstrap.key,
//                             hintText: "Password",
//                             passwordIcon: true),
//                         MyTextField(
//                             controller: againPasswordController,
//                             icon: Bootstrap.key,
//                             hintText: "Again Password",
//                             passwordIcon: true),
//
//
//                         const SizedBox(height: 20,),
//
//                         /* Click Sing In page */
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Text("Do you have an account?",style: TextStyle(fontSize: 16,color: Colors.grey),),
//                             TextButton(onPressed: (){
//                               Navigator.pushReplacementNamed(context, SignIn.id);
//                             }, child: const Text("Sign In",style: TextStyle(fontSize: 16,fontWeight:FontWeight.w700,color: primaryColor),),
//                             )
//                           ],
//                         ),
//
//                         const SizedBox(height: 15,),
//
//                         /* Button */
//                         GestureDetector(
//                           onTap: (){
//                            _doSignUp();
//                           },
//                           child: Container(
//                             height: 45,
//                             width: 150 ,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 gradient: const LinearGradient(
//                                     begin: Alignment.bottomLeft,
//                                     end: Alignment.topRight,
//                                     colors: [
//                                       Color(0xFF24c6dc),
//                                       Color(0xFF514a9d),
//                                     ]
//                                 )
//                             ),
//                             child: const Center(
//                               child: Text("Sign Up",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900),),
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
