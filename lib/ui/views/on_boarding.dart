// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/ui/views/big_container.dart';

import '../../utilities/constant.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final int _numPage = 3;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPage; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
          color: isActive ? PURPLE_COLOR : PURPLE_DEGRADE_2_COLOR,
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            color: WHITE_COLOR,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const BigContainer()));
                        },
                        child: const Text(
                          "Ignorer",
                          style: TextStyle(
                            color: PURPLE_COLOR,
                            fontSize: 20,
                          ),
                        ))),
                SizedBox(
                  height: 400,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: const <Widget>[
                      Padding(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Réparez rapidement!",
                                style: TextStyle(
                                  color: BLACK_COLOR,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Trouvez facilement un technicien près de chez vous!",
                                style: TextStyle(
                                  color: BLACK_COLOR,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              // Center(
                              //   child: Image(
                              //     image: AssetImage(
                              //         "assets/icons/ripair_logo.png"),
                              //     height: 250,
                              //     width: 250,
                              //   ),
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Consultez les avis!",
                                style: TextStyle(
                                  color: BLACK_COLOR,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Des avis de nombreuses personnes pour vous aider à choisir le meilleur.",
                                style: TextStyle(
                                  color: BLACK_COLOR,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              // Center(
                              //   child: Image(
                              //     image: AssetImage(
                              //         "assets/icons/ripair_logo.png"),
                              //     height: 250,
                              //     width: 250,
                              //   ),
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Astuces!",
                                style: TextStyle(
                                  color: BLACK_COLOR,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Trouvez des astuces pour rendre vos journées plus aisées.",
                                style: TextStyle(
                                  color: BLACK_COLOR,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
