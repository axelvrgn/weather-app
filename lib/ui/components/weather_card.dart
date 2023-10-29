import 'package:flutter/material.dart';
import 'package:weather_app/model/hour_item.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/components/weather_per_hour.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatefulWidget {
  final Weather weather;
  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final hourFormat = new DateFormat('HH');
  List<HourItem> hourItemsFromNowToday = [];
  List<HourItem> hourItemsFromNowTomorrow = [];
  List<HourItem> hourItemsFromNowFor24H = [];

  int indexOfNow = 0;
  @override
  void initState() {
    super.initState();
    indexOfNow = widget.weather.forecast!.forecastday![0].hour!.indexWhere(
        (element) =>
            hourFormat.format(DateTime.parse(element.time.toString())) ==
            hourFormat.format(DateTime.now()));

    hourItemsFromNowToday
        .addAll(widget.weather.forecast!.forecastday![0].hour!);
    hourItemsFromNowToday.removeRange(0, indexOfNow);
    hourItemsFromNowTomorrow
        .addAll(widget.weather.forecast!.forecastday![1].hour!);
    hourItemsFromNowTomorrow.removeRange(
        widget.weather.forecast!.forecastday![1].hour!.length -
            hourItemsFromNowToday.length +
            1,
        widget.weather.forecast!.forecastday![1].hour!.length);
    hourItemsFromNowFor24H.addAll(hourItemsFromNowToday);
    hourItemsFromNowFor24H.addAll(hourItemsFromNowTomorrow);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${widget.weather.location!.name!}, ${widget.weather.location!.country}',
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text('${widget.weather.current!.temp_c!.round()} °',
                style: const TextStyle(fontSize: 60.0)),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.network('https:${widget.weather.current!.condition!.icon}',
                  height: 70, fit: BoxFit.fill),
              Text(
                '${widget.weather.current!.condition!.text}',
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.arrow_upward),
                    Text(
                      '${widget.weather.forecast!.forecastday![0].day!.maxtemp_c} °',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.arrow_downward),
                        Text(
                          '${widget.weather.forecast!.forecastday![0].day!.mintemp_c} °',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ]))
            ]),
          ),
          const Divider(),
          Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Prévisions'.toUpperCase(),
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: hourItemsFromNowFor24H.map((hourItem) {
                  return (WeatherPerHour(hourItem: hourItem));
                }).toList()),
          ),
        ],
      ),
    );
  }
}
