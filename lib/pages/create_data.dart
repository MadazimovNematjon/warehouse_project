import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../component/upload_text_field.dart';
import '../controllers/create_controller.dart';
import '../utility/colors.dart';
import '../utility/my_text_style.dart';
import '../views/my_dropdown_button.dart';

class CreateData extends StatefulWidget {
  const CreateData({
    Key? key,
  }) : super(key: key);

  static String get id => "upload_data";

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateController>(
      init: CreateController(),
        builder: (controller) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: controller.uploadImage(),
                child: Container(
                  width: 500.w,
                  child: Get
                      .find<CreateController>()
                      .saveImage == null
                      ? Image.asset(
                    "assets/images/upload.png",
                    color: Colors.white,
                    width: 300.w,
                    height: 300.h,
                  )
                      : Image.file(
                    controller
                        .saveImage!,
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            UploadTextField(
                controller:controller
                    .productNameController,
                hintText: "Maxsulot nomi"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 2,
                    child: UploadTextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller:controller
                            .quantityController,
                        hintText: "Maxsulot miqdori")),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 58,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                            width: 1,
                          )),
                      child: MyDropdownButton(controller,controller.quantityType)),
                )
              ],
            ),
            UploadTextField(
                controller:controller
                    .aboutController,
                hintText: "Maxsulot haqida"),
            UploadTextField(
                controller: controller
                    .priceController,
                hintText: "Narxi"),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "cancel",
                          style: MyTextStyle.textW600White20,
                        ))),
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          controller.createNewContent();
                        },
                        child: Text(
                          "send",
                          style: MyTextStyle.textW600White20,
                        ))),
              ],
            )
          ],
        ),
      );
    });
  }
}
