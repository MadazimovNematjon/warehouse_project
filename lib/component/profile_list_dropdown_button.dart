import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:warehouse_project/controllers/transaction_controller.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/utility/colors.dart';


class DropdownProfile extends StatelessWidget {
  const DropdownProfile({super.key});

  // final ProfileListModel profileListModel;
  // final ProfileListController controller;
  // DropdownExample({required this.controller,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiSelectDropDown.network(
        // backgroundColor: kDefaultFonColor,
        hintColor: Colors.white,
        borderColor: Colors.grey,
        focusedBorderColor: Colors.blue,
        borderRadius: 10,
        optionTextStyle: TextStyle(color: Colors.white),
        selectedOptionBackgroundColor: bgColor,
        backgroundColor: Colors.transparent,
        optionsBackgroundColor: secondaryColor,
        dropdownHeight: 200,

        onOptionSelected: (options) {
          LogService.e(options.toString());
        },
        networkConfig: NetworkConfig(
          url: 'http://192.168.20.49:8080/profile/list',
          // method: RequestMethod.post,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        chipConfig: const ChipConfig(wrapType: WrapType.wrap,),
        responseParser: (response) {
          debugPrint('Response: $response');

          final list = (response as List<dynamic>).map((e) {
            final item = e as Map<String, dynamic>;
            String email = item["email"];
            GetBuilder<TransactionController>(
              init: TransactionController(),
                builder: (controller) {
              return controller.updateValue(reciverEmail: email);
            });
            return ValueItem(
              label: item['name'],
              value: item['id'].toString(),
            );
          }).toList();

          return Future.value(list);
        },
        responseErrorBuilder: ((context, body) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Error fetching the data'),
          );
        }),
        maxItems: 1,
      ),
    );
  }
}
