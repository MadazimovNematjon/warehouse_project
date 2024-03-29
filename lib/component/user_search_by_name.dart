import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:warehouse_project/controllers/transaction_controller.dart';
import 'package:warehouse_project/controllers/user_search_controller.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/utility/colors.dart';
import 'package:warehouse_project/utility/my_text_style.dart';

class UserSearchField extends StatelessWidget {
  const UserSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserSearchController>(
      init: UserSearchController(),
      builder: (controller) {
        return SearchField(
          controller: controller.inputController,
          onSearchTextChanged: (query) {
            controller.searchUser(query);
            return null;
          },
          suggestions: controller.searchResults.map(
                (e) =>
                SearchFieldListItem<UserModel>( e.name.toString(), item: e),
          ).toSet().toList(),
          suggestionState: Suggestion.hidden,
          textInputAction: TextInputAction.next,
          validator: (x) {
            if (!controller.searchResults.contains(x) || x!.isEmpty) {
              LogService.d('Please Enter a valid State $x');
            }
            return null;
          },
          searchInputDecoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black26)),
            hintText: "user search".tr,
            hintStyle: MyTextStyle.textWhite16,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.blue,
              ),
            ),
          ),

          searchStyle: MyTextStyle.textWhite16,
          autoCorrect: false,
          suggestionStyle: MyTextStyle.textWhite16,
          marginColor: Colors.white,
          suggestionsDecoration: SuggestionDecoration(
            color: bgColor,
            padding: const EdgeInsets.only(left: 10, right: 10),
          ),
          maxSuggestionsInViewPort: 6,
          itemHeight: 50,
          onSuggestionTap: (x) {
            final transactionController = Get.find<TransactionController>();
            transactionController.upDateReciver(x.item!.email!);
          },

        );
      },
    );
  }
}
