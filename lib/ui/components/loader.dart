import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utilities/constant.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: WHITE_COLOR,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SpinKitRing(
              color: Colors.blue,
            ),
            const SizedBox(
              height: 25,
            ),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Chargement...',
                    speed: const Duration(milliseconds: 500),
                    textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ));
  }
}
