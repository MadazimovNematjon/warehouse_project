import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/component/product_search_by_name.dart';
import 'package:warehouse_project/component/upload_text_field.dart';
import 'package:warehouse_project/component/user_search_by_name.dart';
import 'package:warehouse_project/controllers/transaction_controller.dart';
import 'package:warehouse_project/utility/my_text_style.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(
      init: TransactionController(),
        builder: (controller) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: 500.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black26,
                                  width: 1,
                                )),
                            child: const UserSearchField()),
                      ),
                      const SizedBox(width: 5,),
                      const Expanded(flex: 1, child: ProductSearchField()),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                UploadTextField(controller: null, hintText: "miqdoqi"),
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
                          controller.updateValue();
                          print("aasdasdasd");
                        },
                        child: Text(
                          "send",
                          style: MyTextStyle.textW600White20,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ));
    });
  }
}
