import 'package:flutter/material.dart';

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
           MyButtonDrawer(
            onTap: () async{
              UserModel? user =  await SecureStorage.getData();
              print("user ${user!.id}");
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
