import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_project/model/product_model.dart';
import 'package:warehouse_project/utility/my_text_style.dart';

Widget itemOfProductAlterDialog(Content content){
  return SizedBox(
    width: 500.w,
    child: Column(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: content!.image_url == null
              ? Image.asset(
            "assets/images/profile_pic.png",
            fit: BoxFit.cover,
          )
              : Image.network(
            content.image_url!,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Text(
            content.productName ?? "",
            style: MyTextStyle.text16,maxLines: 1,overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: 180,
                child: Row(
                  children: [

                    const SizedBox(width: 5),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text(
                    content.email?.toString() ?? '',
                    style: MyTextStyle.text16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    content.id.toString() ?? '',
                    style: MyTextStyle.text16,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                content.createDate ?? "",
                style: MyTextStyle.text16,
              ),
            ),
          ],
        ),
        const Divider()
      ],
    ),
  );
}