// ignore_for_file: must_be_immutable, sort_child_properties_last, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:weather_app/ui/views/home.dart';

import '../../utilities/constant.dart';

class BigContainer extends StatefulWidget {
  const BigContainer({Key? key}) : super(key: key);

  @override
  State<BigContainer> createState() => _BigContainerState();
}

class _BigContainerState extends State<BigContainer> {
  List<Widget> tabList = [
    const HomePage(),
  ];
  int selectedIndex = 0;

  final pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(bottom: 0),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) => setState(() {
              selectedIndex = index;
            }),
            children: tabList,
          ),
        ),
      ]),
    );
  }
}
