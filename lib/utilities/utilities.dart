import 'package:flutter/material.dart';
import '../model/enum.dart';
import 'constant.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Utilities {
  static const String ROOT_BASE_URL = "";

  static const String API_BASE_URL = "http://api.weatherapi.com/v1";

  static const String APP_NAME = "Weather App";

  static const String AD_MOB_ID = "";

  static const String AD_BANNER_UNIT_ID = "";

  static const String AD_REWARDED_UNIT_ID = "";

  /* This function return icon path according PostSource */
  String getApplicationStatus(String status) {
    if (status == "SENT") {
      return 'ENVOYÉE';
    } else if (status == "ACCEPTED") {
      return 'ACCEPTÉE';
    } else if (status == "REJECTED") {
      return 'REJETÉE';
    } else if (status == "PROGRESS") {
      return 'EN COURS';
    } else {
      return 'EN ATTENTE';
    }
  }

  Color getApplicationStatusColor(String status) {
    if (status == "SENT") {
      return YELLOW_COLOR;
    } else if (status == "ACCEPTED") {
      return GREEN_COLOR;
    } else if (status == "REJECTED") {
      return RED_COLOR;
    } else if (status == "PROGRESS") {
      return PURPLE_COLOR;
    } else {
      return GRAY_COLOR;
    }
  }

  showModalDialog(BuildContext context, String header, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(header, textAlign: TextAlign.center),
          content: SizedBox(
              width: double.maxFinite,
              child: AutoSizeText(message,
                  maxLines: 4, textAlign: TextAlign.center)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              child: const Text(
                "OK",
                style: TextStyle(color: PURPLE_COLOR),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  /* This function return icon path according PostSource */
  Color getBackgroundColor(ErrorType type) {
    if (type == ErrorType.INFO) {
      return PURPLE_COLOR.withOpacity(.6);
    } else if (type == ErrorType.SUCCESS) {
      return GREEN_COLOR.withOpacity(.6);
    } else if (type == ErrorType.DANGER) {
      return RED_COLOR.withOpacity(.6);
    } else {
      return const Color(0x99000000);
    }
  }

  bool isHttpOrHttps(String url) {
    return url.startsWith("http://") || url.startsWith("https://");
  }
}
