import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/language_controller.dart';
import 'package:warehouse_project/controllers/product-ownership.dart';
import 'package:warehouse_project/services/log_service.dart';

import '../model/user_model.dart';
import '../services/save_secure_storage.dart';
import '../utility/colors.dart';
import 'my_button_draw.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  bool uz = false;
  bool en = false;
  bool ru = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      decoration: const BoxDecoration(
        color: secondaryColor,
      ),
      child: GetBuilder<LanguageController>(
        init: LanguageController(),
          builder: (controller) {
        return Column(
          children: [
            const SizedBox(
              height: 60,
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: 200,
              height: 330,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: Image
                                .asset("assets/images/logo.png")
                                .image)),
                  ),
                  SizedBox(height: 20,),
                  const Center(
                      child: Text(
                        "Innovatsion Texnologiyalari Markazi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            Divider(color: Colors.grey,),

          Column(
            children: [
              CheckboxListTile(
                title: Text("Uz"),
                value: uz,
                onChanged: (bool? newValue) {
                  setState(() {
                    uz = newValue!;
                    en = false;
                    ru= false;
                    controller.changeLanguage('uz', 'UZ');
                  });
                },
                checkColor: Colors.white,
                activeColor: Colors.blue,selectedTileColor: Colors.red,
                // hoverColor: Colors.red,
                controlAffinity: ListTileControlAffinity.leading,
                tileColor: Colors.white,
                // tristate: true,
              ),

              CheckboxListTile(
                title: Text("Rus"),
                value: ru,
                onChanged: (bool? newValue) {
                  setState(() {
                    ru = newValue!;
                    uz = false;
                    en= false;
                    controller.changeLanguage('ru', 'RU');
                  });
                },
                checkColor: Colors.white,
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
                tileColor: Colors.white,
                // tristate: true,
              ),
              CheckboxListTile(
                title: Text("Eng"),
                value: en,
                onChanged: (bool? newValue) {
                  setState(() {
                    en = newValue!;
                    uz = false;
                    ru= false;
                    controller.changeLanguage('en', 'US');
                  });
                },

                checkColor: Colors.white,
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
                tileColor: Colors.white,
                // tristate: true,
              ),
            ],
          )


            // MyButtonDrawer(
            //   onTap: () async {
            //     UserModel? user = await SecureStorage.getData();
            //     LogService.i("user ${user!.id} ${user.name}  ${user.email}");
            //   },
            //   title: "Profile",
            //   icon: Icons.person,
            // ),

            // GetBuilder<ProductOwnershipController>(
            //   init: ProductOwnershipController(),
            //     builder: (controller) {
            //   return MyButtonDrawer(
            //     onTap: () async {
            //     controller.fetchContentData();
            //     },
            //     title: "Profile",
            //     icon: Icons.person,
            //   );
            // }),
          ],
        );
      }),
    );
  }
}
