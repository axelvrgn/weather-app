import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/ui/components/loader.dart';
import 'package:weather_app/ui/components/weather_card.dart';

import '../../utilities/constant.dart';
import '../../utilities/utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showbtn = false;
  final listViewScrollController = ScrollController();
  final keywordController = TextEditingController();
  final locationController = TextEditingController();

  Weather? weather;

  Future<void> getWeatherData(String location) async {
    var provider = Provider.of<WeatherProvider>(context, listen: false);
    weather = await provider.getWeather(context, location);
    if (mounted) {
      setState(() {
        weather = weather;
      });
    }
  }

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(Utilities.APP_NAME);

  @override
  void initState() {
    listViewScrollController.addListener(() {
      double showoffset = 10.0;
      if (listViewScrollController.offset > showoffset) {
        setState(() {
          showbtn = true;
        });
      } else {
        setState(() {
          showbtn = false;
        });
      }
    });
    super.initState();

    getWeatherData('Paris');
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
        builder: (BuildContext context, data, Widget? child) => Scaffold(
            appBar: AppBar(
              title: customSearchBar,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (customIcon.icon == Icons.search) {
                        customIcon = const Icon(Icons.cancel);
                        customSearchBar = ListTile(
                          leading: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          ),
                          title: TextField(
                            onChanged: (text) {
                              getWeatherData(text);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Rechercher un ville...',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else {
                        customIcon = const Icon(Icons.search);
                        customSearchBar = const Text(Utilities.APP_NAME);
                      }
                    });
                  },
                  icon: customIcon,
                )
              ],
            ),
            backgroundColor: WHITE_COLOR,
            floatingActionButton: AnimatedOpacity(
              duration: const Duration(milliseconds: 100), //show/hide animation
              opacity:
                  showbtn ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
              child: FloatingActionButton(
                mini: true,
                onPressed: () {
                  listViewScrollController.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn);
                },
                child: Icon(
                  Icons.arrow_upward,
                  size: 20,
                ),
                backgroundColor: PURPLE_DEGRADE_2_COLOR,
                elevation: 0,
                splashColor: PURPLE_COLOR,
              ),
            ),
            body: Container(
                alignment: Alignment.topCenter,
                color: WHITE_COLOR,
                child: weather != null
                    ? WeatherCard(weather: weather!)
                    : const Loader())));
  }
}
