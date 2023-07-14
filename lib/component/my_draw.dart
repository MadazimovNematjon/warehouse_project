import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      decoration: const BoxDecoration(
        color: secondaryColor,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),

          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: Image.asset("assets/images/logo.png").image)),
                )
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: const Center(
                child: Text(
              "Innovatsion Texnologiyalari Markazi",textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),

          MyButtonDrawer(
            onTap: () async {
              UserModel? user = await SecureStorage.getData();
              LogService.i("user ${user!.id} ${user.name}  ${user.email}");
            },
            title: "Profile",
            icon: Icons.person,
          ),
          // const MyButtonDrawer(
          //   // onTap: SizedBox.shrink,
          //   title: "Message",
          //   icon: Icons.send,
          // ),
          // const MyButtonDrawer(
          //   // onTap: SizedBox.shrink,
          //   title: "Settings",
          //   icon: Icons.settings,
          // ),
        ],
      ),
    );
  }
}
