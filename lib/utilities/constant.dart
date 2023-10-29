import 'package:flutter/material.dart';

const Color RED_COLOR = Color.fromRGBO(212, 27, 27, 1);
const Color GRAY_COLOR = Color.fromRGBO(65, 76, 90, 1);
const Color WHITE_COLOR = Color(0XffFFFFFF);
const Color GREEN_COLOR = Color.fromRGBO(00, 122, 94, 1);
const Color BLACK_COLOR = Color(0Xff1E1E1E);
const Color YELLOW_COLOR = Color.fromRGBO(245, 215, 57, 1);

const Color PURPLE_COLOR = Color(0Xff4E007A);
const Color PURPLE_DEGRADE_1_COLOR = Color(0XffB433FF);
const Color PURPLE_DEGRADE_2_COLOR = Color(0XffE9C2FF);

const Color BACKGROUND_COLOR = Color.fromARGB(255, 239, 239, 245);
const Color GRAY_DEGRADE_1_COLOR = Color.fromRGBO(103, 113, 126, 1);
const Color GRAY_DEGRADE_2_COLOR = Color.fromRGBO(172, 183, 198, 1);
const Color GRAY_DEGRADE_TRANSPARENT = Color.fromRGBO(58, 70, 86, 1);
const Color FONT_COLOR = Color.fromRGBO(85, 101, 124, 1);

//Social Medial colors
const Color TWITTER_COLOR = Color(0Xff00acee);
const Color YOUTUBE_COLOR = Color(0XffFF0000);
const Color GOOGLE_COLOR = Color(0XffDB4437);
const Color FACEBOOK_COLOR = Color(0Xff3b5998);
const Color INSTAGRAM_COLOR = Color(0Xffe95950);
const Color OTHER_COLOR = Color.fromARGB(255, 237, 172, 167);

final OutlineInputBorder customInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: GRAY_COLOR),
    borderRadius: BorderRadius.circular(10.0));
const TextStyle customInputLabelStyle =
    TextStyle(color: GRAY_COLOR, fontSize: 15);
const TextStyle customInputHinttextStyle =
    TextStyle(fontStyle: FontStyle.italic, fontSize: 11, color: GRAY_COLOR);
final List<BoxShadow> customCardBoxShadow = [
  BoxShadow(
    color: GRAY_DEGRADE_2_COLOR.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
    offset: const Offset(2.5, 2.5),
  ),
  BoxShadow(
    color: GRAY_DEGRADE_2_COLOR.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
    offset: const Offset(-2.5, -2.5),
  )
];
