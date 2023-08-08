import 'package:characterviewer/resources/constants.dart';

class Character {
  String? firstURL;
  String? icon;
  String? result;
  String? text;
  String? title;
  String? description;

  Character(
      {this.firstURL,
      this.icon,
      this.result,
      this.text,
      this.title,
      this.description});

  Character.fromJson(Map<String, dynamic> json) {
    firstURL = json['FirstURL'];
    icon = json['Icon'] != null ? json['Icon']['URL'] : null;
    result = json['Result'];
    text = json['Text'];
    if (text?.isNotEmpty == true) {
      setTitleAndDes(text!);
    }
  }

  void setTitleAndDes(String text) {
    int underscoreIndex = text.indexOf(" - ");
    if (underscoreIndex != -1) {
      title = text.substring(0, underscoreIndex);
      description = text.substring(underscoreIndex + 3);
    }
  }

  String? get imageURl {
    if (icon?.isNotEmpty == true) {
      return imageBaseUrl + icon!;
    }
    return null;
  }
}
