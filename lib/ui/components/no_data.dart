import 'package:flutter/material.dart';
import '../../utilities/constant.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: WHITE_COLOR,
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Center(
                child: Icon(
              Icons.search_sharp,
              color: BLACK_COLOR,
              size: 32,
            )),
            SizedBox(
              height: 15,
            ),
            Text(
              "Aucune données disponible pour l'instant",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: PURPLE_COLOR),
            ),
          ],
        ));
  }
}
