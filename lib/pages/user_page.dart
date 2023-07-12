import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/component/my_text_field.dart';
import 'package:warehouse_project/controllers/user_contoller.dart';
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
        return  Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Account",
                style: TextStyle(
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
                    child: Container(
                        height: 150,
                        width: 150,
                        child: Image.asset("assets/images/user.jpg",)),
                  ),
                  const SizedBox(height: 20,),
                  controller.hidden ?   TextField(
                    controller: controller.cityController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ):
                  Text("First nmae   Last name",style: MyTextStyle.textW600White20,),
                  const SizedBox(height: 20,),

                  controller.hidden == false ? GestureDetector(
                    onTap: (){
                      controller.editUserInfo();
                    },
                    child: Container(
                      height: 25,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xFF24c6dc),
                                Color(0xFF514a9d),
                                // primaryColor.withOpacity(0.),
                              ])
                      ),
                      child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Edit",style: TextStyle(color: Colors.white,fontSize: 16),),
                              SizedBox(width: 10,),
                              Icon(Icons.edit,color: Colors.white,size: 16,)
                            ],
                          )
                      ),
                    ),
                  ): const SizedBox.shrink(),

                  const SizedBox(height: 10,),

                  const Divider(color: Colors.white,),
                  const SizedBox(height: 10,),

                  controller.hidden ?  TextField(
                    controller: controller.cityController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Email:",style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text("nmadazimov734@gmail.com  ",style: MyTextStyle.textW600White20,maxLines: 1, overflow: TextOverflow.ellipsis,)),
                    ],
                  ),


                  const SizedBox(height: 20,),
                  controller.hidden ?  TextField(
                    controller: controller.cityController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "City",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("City:",style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
                      const SizedBox(width: 10,),
                      Text("Tashkent",style: MyTextStyle.textW600White20,),
                    ],
                  ),


                  const SizedBox(height: 20,),
                  controller.hidden ?  TextField(
                    controller: controller.cityController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Phone:",style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text("+998(99) 409-19-38",style: MyTextStyle.textW600White20,maxLines: 1, overflow: TextOverflow.ellipsis,)),
                    ],
                  ),



                  //  const SizedBox(height: 20,),
                  // hidden ?  TextField(
                  //   controller: cityController,
                  //   decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       hintText: "City",
                  //     hintStyle: TextStyle(color: Colors.white)
                  //   ),
                  // ):
                  //  Row(
                  //    mainAxisAlignment: MainAxisAlignment.start,
                  //    children: [
                  //      Text("Email:",style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
                  //      const SizedBox(width: 10,),
                  //      Expanded(child: Text("nmadazimov734@gmail.com  ",style: MyTextStyle.textW600White20,maxLines: 1, overflow: TextOverflow.ellipsis,)),
                  //    ],
                  //  ),

                  controller.hidden? GestureDetector(
                    onTap: (){
                      controller.saveUserInfo();
                    },
                    child: Container(
                      height: 25,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFF24c6dc),
                      ),
                      child: const Center(
                          child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 18),)
                      ),
                    ),
                  ): const SizedBox.shrink(),

                ],
              )

              // Chart(),
              // StorageInfoCard(
              //   svgSrc: "assets/icons/Documents.svg",
              //   title: "Documents Files",
              //   amountOfFiles: "1.3GB",
              //   numOfFiles: 1328,
              // ),
              // StorageInfoCard(
              //   svgSrc: "assets/icons/media.svg",
              //   title: "Media Files",
              //   amountOfFiles: "15.3GB",
              //   numOfFiles: 1328,
              // ),
              // StorageInfoCard(
              //   svgSrc: "assets/icons/folder.svg",
              //   title: "Other Files",
              //   amountOfFiles: "1.3GB",
              //   numOfFiles: 1328,
              // ),
              // StorageInfoCard(
              //   svgSrc: "assets/icons/folder.svg",
              //   title: "Unknown",
              //   amountOfFiles: "1.3GB",
              //   numOfFiles: 140,
              // ),
            ],
          ),
        );
      },
    );
  }
}