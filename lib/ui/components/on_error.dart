import 'package:flutter/material.dart';

import '../../utilities/constant.dart';

class OnError extends StatelessWidget {
  const OnError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: WHITE_COLOR,
        child: const Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Icon(
              Icons.error_outline_outlined,
              color: RED_COLOR,
              size: 40,
            )),
            SizedBox(
              height: 15,
            ),
            Text(
              "Une erreure est survenue !",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: BLACK_COLOR),
            ),
          ],
        ));
  }
}
