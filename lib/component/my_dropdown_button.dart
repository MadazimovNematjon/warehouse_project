import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/create_controller.dart';
import '../utility/colors.dart';

Widget MyDropdownButton(CreateController controller,String quantityType) {

  return DropdownButton<String>(
    isExpanded: true,
    value: quantityType,
    icon: const Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: const TextStyle(fontSize: 20, color: Colors.white),
    underline: const SizedBox.shrink(),
    focusColor: secondaryColor,
    dropdownColor: secondaryColor,
    padding: const EdgeInsets.all(5),
    onChanged: (String? newValue) {
      if (newValue != null) {
        controller.updateValue(newValue);
      }
    },
    items:  <DropdownMenuItem<String>>[
      DropdownMenuItem<String>(
        value: 'kg',
        child: Text('kg'.tr),
      ),
      DropdownMenuItem<String>(
        value: 'piece',
        child: Text('piece'.tr),
      ),
      DropdownMenuItem<String>(
        value: 'liter',
        child: Text('liter'.tr),
      ),
    ],
  );
}