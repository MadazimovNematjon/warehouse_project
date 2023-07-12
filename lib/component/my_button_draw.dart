import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButtonDrawer extends StatelessWidget {
  const MyButtonDrawer({Key? key, this.title, this.icon, required this.onTap,}) : super(key: key);

  final Function() onTap;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 40,
        width:double.infinity,
      margin: EdgeInsets.only(top: 10.w,left: 10,right: 10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Icon(icon!,color: Colors.grey.shade300,size: 25.h,),
            const SizedBox(width: 15,),
            Text(title!,style: TextStyle(color: Colors.grey.shade300,fontSize: 16.spMax),)
          ],
        ),
      ),
    );
  }
}
