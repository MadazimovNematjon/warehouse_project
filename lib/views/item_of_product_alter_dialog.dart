import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:warehouse_project/model/product_model.dart';
import 'package:warehouse_project/utility/my_text_style.dart';

Widget itemOfProductAlterDialog(Content content) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SizedBox(
      width: 500.w,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: content!.image_url == null
                ? Image.asset(
                    "assets/images/profile_pic.png",
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    content.image_url!,
                    fit: BoxFit.contain,
                  ),
          ),

          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  Expanded(
                    child: Text(
                      "${content.productName}   ${content.quantity!} ${content.product_quantity_type!.tr}" ?? "",
                      style: MyTextStyle.textWhite16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(content.createDate!,style: MyTextStyle.textWhite16,)

                ],
              ),
              SizedBox(height: 5,),
              Text(content.email!,style: MyTextStyle.textWhite16,),
              SizedBox(height: 10,),
              ReadMoreText(
                content.productAbout!,
                trimLines: 10,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'show more'.tr,
                trimExpandedText: 'show less'.tr,
                style: MyTextStyle.textWhite16,
                moreStyle: MyTextStyle.textWhite16,
              )
            ],
          ),



          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Expanded(
          //       flex: 3,
          //       child: SizedBox(
          //         width: 180,
          //         child: Row(
          //           children: [
          //
          //             SizedBox(width: 5),
          //
          //           ],
          //         ),
          //       ),
          //     ),
          //
          //     const SizedBox(height: 5),
          //
          //     Expanded(
          //       flex: 2,
          //       child: Row(
          //         children: [
          //           Text(
          //             content.email?.toString() ?? '',
          //             style: MyTextStyle.text16,
          //           ),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           Text(
          //             content.id.toString() ?? '',
          //             style: MyTextStyle.text16,
          //           ),
          //         ],
          //       ),
          //     ),
          //
          //     Expanded(
          //       flex: 1,
          //       child: Text(
          //         content.createDate ?? "",
          //         style: MyTextStyle.text16,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    ),
  );
}
