import 'package:flutter/material.dart';
import 'package:warehouse_project/controllers/create_controller.dart';
import '../utility/colors.dart';

Widget MyDropdownButton(CreateController controller,String quantityType) {

  return DropdownButton<String>(
    isExpanded: true,
    value: quantityType,
    icon: const Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(fontSize: 20, color: Colors.white),
    underline: SizedBox.shrink(),
    focusColor: secondaryColor,
    dropdownColor: secondaryColor,
    padding: EdgeInsets.all(5),
    onChanged: (String? newValue) {
      if (newValue != null) {
        controller.quantityType = newValue;
      }
    },
    items: const <DropdownMenuItem<String>>[
      DropdownMenuItem<String>(
        value: 'kg',
        child: Text('kg'),
      ),
      DropdownMenuItem<String>(
        value: 'dona',
        child: Text('dona'),
      ),
      DropdownMenuItem<String>(
        value: 'litr',
        child: Text('litr'),
      ),
    ],
  );
}