import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/component/my_text_field.dart';
import 'package:warehouse_project/controllers/user_contoller.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/pages/sign_in.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';
import 'package:warehouse_project/utility/my_text_style.dart';

import '../utility/colors.dart';

class UserPage extends StatefulWidget {
   UserPage({Key? key,}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (controller){
        UserModel? user = controller.user;
        if (user == null) {
          return const SizedBox.shrink(); // or any other loading indicator
        }
        return  Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child:  Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "my account".tr,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: defaultPadding),

                  Center(
                    child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset("assets/images/user.jpg",)),
                  ),
                  const SizedBox(height: 20,),
                  controller.hidden ?   TextField(
                    controller: controller.cityController,
                    decoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: "name".tr,
                        hintStyle: const TextStyle(color: Colors.grey)
                    ),
                  ):
                  Text( "${user.name}  ${user.surname} ",style: MyTextStyle.textW600White20,),

                  const SizedBox(height: 20,),

                  const Divider(color: Colors.white,),

                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("email".tr,style: TextStyle(color: Colors.grey,fontSize: 16.spMax),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text(user.email!,style: MyTextStyle.textWhite16,maxLines: 1, overflow: TextOverflow.ellipsis,)),
                    ],
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("city:".tr,style: TextStyle(color: Colors.grey,fontSize:  16.spMax),),
                      const SizedBox(width: 10,),
                      Text(" ",style: MyTextStyle.textWhite16,),
                    ],
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("phone:".tr,style: TextStyle(color: Colors.grey,fontSize:  16.spMax),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text(" ",style: MyTextStyle.textWhite16,maxLines: 1, overflow: TextOverflow.ellipsis,)),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: 50,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    Get.off(()=> const SignIn());
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text("log out".tr,style: MyTextStyle.textWhite16,)),
                  ),
                ),
              )
              
            ],
          ),
        );
      },
    );
  }
}