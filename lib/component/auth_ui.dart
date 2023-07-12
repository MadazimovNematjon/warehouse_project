import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse_project/responsive/size_config.dart';
import 'package:warehouse_project/utility/colors.dart';

class AuthUi extends StatelessWidget {
  final Widget child;

  const AuthUi({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.all(30),
      constraints: const BoxConstraints(
        minWidth: 750,
        maxWidth: 800,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: secondaryColor,
      ),
      height: 500,
      width: 800,
      child: Row(
        children: [
          if(SizeConfig.screenWidth! > 800)
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF24c6dc),
                      Color(0xFF514a9d),
                    ],
                  ),
                ),
                child: Lottie.asset(
                  'assets/animation/signUp.json',
                  height: 600,
                ),
              ),
            ),
          child,
        ],
      ),
    );
  }
}
