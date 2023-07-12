

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
}
