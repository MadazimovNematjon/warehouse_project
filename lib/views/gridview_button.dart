import 'package:flutter/material.dart';

import '../utility/colors.dart';
import '../utility/my_text_style.dart';

Widget gridviewButton({
  required String title,
  required String image,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding:  EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding),
        color: secondaryColor,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              image,
              color: Colors.white70,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: MyTextStyle.textWhite16,
            ),
          ),
        ],
      ),
    ),
  );
}