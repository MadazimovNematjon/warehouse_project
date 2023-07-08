import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';


// Use the class with the alias


class UtilsService {

//   final BuildContext context;
//   String? message;
// String? contentType;
//
// UtilsService( this.contentType,
//    this.message, this.context,);

  static String currantDate() {
    DateTime now = DateTime.now();
    String convertedDateTime =
        "${now.year.toString()}- ${now.month.toString().padLeft(2, "0")}-${now.day.toString().padLeft(2, "0")} ${now.hour.toString()}:${now.minute.toString()}";

    return convertedDateTime;
  }


   showToast({
    required BuildContext context,
    required String message,
    required ContentType contentType,
  }) {
    String assetPath = assetSVG(contentType);

   return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        /// Set the properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'On Snap!',
          message: message,

          /// Change contentType to ContentType.success, ContentType.warning, or ContentType.help for variants
          contentType: contentType,
        ),
      ),
    );
  }

  @override
  String assetSVG(ContentType contentType) {
    if (contentType == ContentType.failure) {
      /// failure will show `CROSS`
      return AssetsPath.failure;
    } else if (contentType == ContentType.success) {
      /// success will show `CHECK`
      return AssetsPath.success;
    } else if (contentType == ContentType.warning) {
      /// warning will show `EXCLAMATION`
      return AssetsPath.warning;
    } else if (contentType == ContentType.help) {
      /// help will show `QUESTION MARK`
      return AssetsPath.help;
    } else {
      return AssetsPath.failure;
    }
  }


}
